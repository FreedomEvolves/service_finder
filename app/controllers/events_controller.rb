class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    if current_user == nil
      @events =  Event.all
    else
      @events = current_user.events #.where(client_id: params[:client_id])
    end
    @clients = Client.all
    @providers = Provider.all
  end

  def show
    @clients = Client.all
    @providers = Provider.all
    @notes = Note.where(event_id: params[:event_id])
  end

  def new
    @event = Event.new
    @event.provider_id = params[:profile_id]
    respond_to do |format|
      format.js {render 'new', layout: false}
    end
  end

  # def new_client
  #   @event = Event.new
  #   render partial: 'new', layout: false
  # end

  # def new_provider
  #   @selected_client = current_user.clients.find(params[:client_id] ) # use param
  #   @event = RecordEvent.new(
  #     creator: current_user.account,
  #     params: { client_id: params[:client_id] }
  #   ).build
  #   render partial: 'new', layout: false
  # end

  def edit
  end

  def create   
    @event = RecordEvent.new(
      creator: current_user.account,
      params: event_params
    ).build

    if @event.save
      provider = Provider.find(@event.provider_id)
      @profile = provider.to_profile_presenter
    else
      render 'new'
    end
    
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: 'Event was successfully updated.'
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
      :client_id,
      :provider_id,
      :event_date,
      :description,
      :amount_paid,
      :has_insurance,
      :client_confirmed,
      :provider_confirmed,
      :rating
    )
  end
end
