# == Schema Information
#
# Table name: events
#
#  id                 :integer          not null, primary key
#  client_id          :integer
#  provider_id        :integer
#  event_date         :date
#  description        :text
#  rating             :boolean
#  amount_paid        :decimal(, )
#  has_insurance      :boolean          default(FALSE)
#  client_confirmed   :boolean          default(FALSE)
#  provider_confirmed :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null

class Event < ActiveRecord::Base
  has_many :notes
  belongs_to :client
  belongs_to :provider

  validates :event_date, presence: true, shortcoded_date: true
  validates :client_id, presence: true
  validates :provider_id, presence: true
  validates :description, presence: true, length: { maximum: 30 }

  def to_s
    "#{confirmed_s} Event"
  end

  def confirmed_s
    confirmed? ? 'Confirmed' : 'Unconfirmed'
  end

  def confirmed?
    provider_confirmed? and client_confirmed?
  end

  #############################################################
  # Dates
  include Dates::UsDate

  def event_date=(value)
    super(parse_date(value))
  end
end
