# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :mastodon, scope: 'read', credentials: lambda { |domain, callback_url|
    Rails.logger.info "Requested credentials for #{domain} with callback URL #{callback_url}"

    instance = Instance.find_or_create_by(host: domain) do |ins|
      Rails.logger.info 'Instance not found. Creating app for mastodon instance.'
      client = Mastodon::REST::Client.new(base_url: "https://#{domain}")
      app = client.create_app('MastodonBirthday', callback_url, 'read')
      ins.client_id = app.client_id
      ins.client_secret = app.client_secret
    end

    [instance.client_id, instance.client_secret]
  }
end
