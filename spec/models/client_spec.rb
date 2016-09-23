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

require 'rails_helper'

RSpec.describe Client, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
