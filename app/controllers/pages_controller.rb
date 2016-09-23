require 'faker'
class PagesController < ApplicationController

  def home
    @setting = false
  end

  def contact_us
  end

  def faq
  end

  def about
  end

  def legal
  end

  def privacy_policy
  end

  def mock_sign_up
    @client = Client.new(
      :last_name => Faker::Name.last_name,
      :first_name => Faker::Name.first_name,
      :gender => 'female',
      :date_of_birth => Faker::Date.between( 50.years.ago, 20.years.ago ),
      :address2 => Faker::Address.street_address,
      :city => Faker::Address.city,
      :state => Faker::Address.state,
      :postal_code => Faker::Address.zip_code,
      :country => Faker::Address.country
      )
    @provider = Provider.new(
      :last_name => Faker::Name.last_name,
      :first_name => Faker::Name.first_name,
      :address2 => Faker::Address.street_address,
      :city => Faker::Address.city,
      :state => Faker::Address.state,
      :postal_code => Faker::Address.zip_code,
      :country => Faker::Address.country,
      :years_of_experience => Faker::Number.between( 0, 25 ),
      :category => 'Doctor',
      :specialty => 'ENT'
      )
  end

  def login_new
    @setting = true
    @client = Client.all
    @provider = Provider.all
  end

  def logout
    @setting = false
    cookies.delete :sf_user
    cookies.delete :sf_user
  end

  def landing_client
#binding.pry
    @client_search = Search.new
    @providers = current_user.providers.uniq || []
    @provider = @providers.last
    @distances = ['5 miles', '10 miles', '25 miles', '50 miles']
    @client_names = ['Bob Harris', 'Pete Sequin', 'Molly Hapt', 'Susan Pfish', 'Jimmy Segers']
    @provider_names = ['Dr. Henry Pill', 'Dr. Frank Pettus', 'Mark Botham, Atty.']
    
  end

  def landing_provider
#binding.pry
    @provider_search = Search.new
    @clients = current_user.clients.uniq || []
    @selected_client = @clients.last
    @distances = ['5 miles', '10 miles', '25 miles', '50 miles']

    @categories = %w[veterinarian masseuse  painter plumber attorney]
    @specialties = %w[dogs cats birds ferrets]
    @services = %w[microchipping immunizations checkup]
  end

  def category_options
    if params[:category]
      to_return = Presenter::Categories.new.specialties(params[:category])
    else
      to_return = Presenter::Categories::CATEGORIES
    end
    respond_to do |format|
      format.json { render status: :ok, json: to_return}
    end
  end

end
