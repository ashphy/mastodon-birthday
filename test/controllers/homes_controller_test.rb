# frozen_string_literal: true

require 'test_helper'

class HomesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get homes_url
    assert_response :success
  end
end
