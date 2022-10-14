# frozen_string_literal: true

require 'test_helper'

class StaffsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get staffs_index_url
    assert_response :success
  end

  test 'should get new' do
    get staffs_new_url
    assert_response :success
  end
end
