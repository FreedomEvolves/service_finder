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
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
