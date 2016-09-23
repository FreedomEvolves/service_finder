class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  def current_user
    if cookies[:sf_user]
      account = LoadAccount.new.run(cookies[:sf_user])
      user_cookie = JSON.parse(cookies[:sf_user])

        @current_user = OpenStruct.new(
          :client? => account.client?, 
          :provider? => account.provider?, 
          :account => account,
          :full_name => account.full_name,
          :last_name => account.last_name,
          :address => account.address,
          :events => account.events,
          :todo => ['Confirm Event', 'Confirm Appointment', 'Email']
        )
      case user_cookie['type']
      when 'provider'
        @current_user[:clients] = account.clients
      when 'client'
        @current_user[:providers] = account.providers
      end
#binding.pry
      return @current_user
    else
      nil
    end
  end
end
