class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]

  def index
    @providers = Provider.where(event_id: params[:event_id])
  end

  def show  
     @profile = @provider.to_profile_presenter
  end

  def new
    @provider = Provider.new
  end

  def edit
  end

  def create
    @provider = Provider.new(provider_params)

    respond_to do |format|
      if @provider.save
        format.html { redirect_to mock_login_path, notice: 'Provider was successfully entered.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    if @provider.update(provider_params)
      redirect_to @provider, notice: 'Provider was successfully updated.' 
    else
      render :edit 
    end
  end

  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
    end
  end

  private

    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:last_name, :first_name, :title, :address1, :address2, :city, :state, :postal_code, :country, :years_of_experience, :category, :specialty)
    end
end
