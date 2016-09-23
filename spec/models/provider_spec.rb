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

require 'rails_helper'

RSpec.describe Provider, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
