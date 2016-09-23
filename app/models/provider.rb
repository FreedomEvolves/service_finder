# == Schema Information
#
# Table name: providers
#
#  id                  :integer          not null, primary key
#  last_name           :string
#  first_name          :string
#  title               :string
#  address1            :string
#  address2            :string
#  city                :string
#  state               :string
#  postal_code         :string
#  country             :string
#  years_of_experience :string
#  category            :string
#  specialty           :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Provider < ActiveRecord::Base

  belongs_to :user_account
  has_one :user, through: :user_account

  has_many :events
  has_many :clients, through: :events # need a mapping table to track provider/client relations

  validates_presence_of :last_name, :first_name, :address2, :city, :state, :postal_code, :country, :years_of_experience, :category, :specialty

  TITLE_OPTIONS = %w[Mr. Ms. Mrs. Dr.]
  COUNTRY_OPTIONS = %W[USA Canada Australia]  ## temporary until a full country list is needed

  def self.title_options
    TITLE_OPTIONS
  end

  def self.country_options
    COUNTRY_OPTIONS
  end

  def full_name
    "#{last_name.capitalize}, #{first_name.capitalize}"
  end

  def full_name_with_title
    "#{title} #{first_name} #{last_name}"
  end

  def address
    if address1 == ''
      "#{address2}, #{city}, #{state}  #{postal_code}"
    else
      "#{address1}, #{address2}, #{city}, #{state}  #{postal_code}"
    end
  end

  def last_service_date_for(client)
    events.where(client_id: client.id).last.event_date
  end

  def provider?
    true
  end

  def client?
    false
  end

  def to_profile_presenter
    Presenter::Profile.new(self)
  end
end
