# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint(8)        not null, primary key
#  username           :string
#  uid                :string
#  provider           :string
#  token              :string
#  sign_in_count      :integer          default(0), not null
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :inet
#  last_sign_in_ip    :inet
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ApplicationRecord
  devise :trackable, :omniauthable, omniauth_providers: [:mastodon]

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.token = auth[:credentials].token
      user.username = auth[:info].name
      Rails.logger.info auth[:extra]
    end
  end

  def post(text)
    client.create_status(text)
  end

  private

  def client
    _, domain = uid.split('@')
    Mastodon::REST::Client.new(
      base_url: "https://#{domain}",
      bearer_token: token
    )
  end
end
