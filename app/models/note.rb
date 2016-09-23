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

class Note < ActiveRecord::Base
	belongs_to :event
  validates :comment, presence: true, length: { maximum: 140 }
end
