# == Schema Information
#
# Table name: user_accounts
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  provider_id :integer
#  client_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe UserAccount, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
