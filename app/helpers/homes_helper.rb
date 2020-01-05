# frozen_string_literal: true

module HomesHelper
  def user_name
    session[:mastodon][:extra][:raw_info][:username]
  end

  def display_name
    session[:mastodon][:extra][:raw_info][:display_name]
  end

  def avatar
    session[:mastodon][:extra][:raw_info][:avatar]
  end

  def domain
    URI.parse(session[:mastodon][:extra][:raw_info][:url]).host
  end

  def user_created_at
    Time.zone.parse(session[:mastodon][:extra][:raw_info][:created_at])
  end

  def formatted_birthday
    l user_created_at, format: :long
  end

  def range
    time_ago_in_words(user_created_at)
  end
end
