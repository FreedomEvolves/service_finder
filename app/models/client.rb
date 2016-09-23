# == Schema Information
#
# Table name: clients
#
#  id            :integer          not null, primary key
#  last_name     :string
#  first_name    :string
#  gender        :string
#  date_of_birth :date
#  address1      :string
#  address2      :string
#  city          :string
#  state         :string
#  postal_code   :string
#  country       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Client < ActiveRecord::Base

  belongs_to :user_account
  has_one :user, through: :user_account
  
  has_many :events
  has_many :providers, -> { distinct }, through: :events  # need a mapping table to track provider/client relations

  validates_presence_of :last_name, :first_name, :gender, :date_of_birth, :address2, :city, :state, :postal_code, :country
  #validates :gender, inclusion: gender

  # GENDER_OPTIONS = %w[male female]
  # COUNTRY_OPTIONS = %w[USA Canada Australia]  ## temporary until a full country list is needed

  # def self.gender_options
  #   GENDER_OPTIONS
  # end

  # def self.country_options
  #   COUNTRY_OPTIONS
  # end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def address
    if address1 == ''
      "#{address2}, #{city}, #{state}  #{postal_code}"
    else
      "#{address1}, #{address2}, #{city}, #{state}  #{postal_code}"
    end
  end

  def last_service_date_for(provider)
    events.where(provider_id: provider.id).last.event_date
  end

  def provider?
    false
  end

  def client?
    true
  end

  def to_profile_presenter
    Presenter::Profile.new(self)
  end
end
