# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  comment    :text
#  author     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
