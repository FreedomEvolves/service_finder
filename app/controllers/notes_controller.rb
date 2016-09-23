class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_event

  def index
    @notes = Note.where(event_id: params[:event_id])
    render layout: false
  end

  def show
  end

  def new
    @note = Note.new
    render layout: false
  end

  def edit
    @event = Event.all
  end

  def create
    @note = Note.new(note_params)
    @note.event_id = params[:event_id]
    @note.author = @current_user.full_name
    
    respond_to do |format|
      if @note.save
        format.html { redirect_to event_path(@event), notice: 'Note was successfully created.' }
        format.js { }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to events_path(@event, @note), notice: 'Note was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  ################################
  private

    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:event_id, :comment, :author, :rating)
    end
end
