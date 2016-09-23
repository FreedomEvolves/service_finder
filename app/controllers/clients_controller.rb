class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  def index
    @clients = Client.all
  end

  def show
    @profile = @client.to_profile_presenter
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    respond_to do |format|
      if @client.save
        format.html { redirect_to client_mock_login_path(@trace), notice: 'Client was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.js { }
      else
        format.html { render :edit }
        format.js { }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
    end
  end

  private

    def set_client
      @client = Client.find(params[:id])
      @selected_client = @client
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:last_name, :first_name, :gender, :date_of_birth, :address1, :address2, :city, :state, :postal_code, :country)
    end
end
