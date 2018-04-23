# frozen_string_literal: true

# == Schema Information
#
# Table name: instances
#
#  id            :bigint(8)        not null, primary key
#  host          :string
#  client_id     :string
#  client_secret :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class InstanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
