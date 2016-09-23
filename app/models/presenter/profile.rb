class Presenter::Profile
  attr_reader :account

  def initialize(account)
    @account = account
  end

  delegate :to_s, 
    :id,
    :address,
    :events,
    :last_service_date_for,
    to: :account

  def profile_name
    if account.client?
      account.full_name
    elsif account.provider?
      account.full_name_with_title
    end         
  end

  def extra_detail
    if account.client?
      "#{time_ago_in_words @selected_client.date_of_birth} old"
    elsif account.provider?
      "Current Services: #{account.specialty}"
    end   
  end

  def type
    if account.client?
      'client'
    elsif account.provider?
      'provider'
    end
  end
        
end