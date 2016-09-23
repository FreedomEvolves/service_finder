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

class UserAccount < ActiveRecord::Base
  belongs_to :user
  has_one :provider
  has_one :client

  validates :user_id, presence: true
  validate :provider_or_client_only

  def account
    provider || client
  end

  def provider_or_client_only
    if provider.nil? && client_id.nil?
      errors.add :provider_id, 'User must either be a provider or client. Neither is set.'
    elsif provider_id && client_id
      errors.add :provider_id, 'User can be only a client or a provider, but not both'
    end
  end

end
