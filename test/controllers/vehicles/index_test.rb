# frozen_string_literal: true

require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:one)
  end

  test 'index - returns vehicle list with pagination' do
    params = {
      latitude: 3.119158,
      longitude: 101.674239
    }
    get vehicles_url(params: params), as: :json

    assert_response :success

    json = JSON.parse(@response.body)

    assert_equal 30, json.count
    assert_kind_of Array, json
    assert_includes json.pluck('id'), @vehicle.id
  end

  test 'index - returns defined vehicle list with page params' do
    params = {
      latitude: 3.119158,
      longitude: 101.674239,
      page: 2
    }
    get vehicles_url(params: params), as: :json

    assert_response :success

    json = JSON.parse(@response.body)

    assert_equal 30, json.count
    assert_kind_of Array, json
    assert_not_includes json.pluck('id'), @vehicle.id
  end

  test 'index - returns filtered vehicle list' do
    params = {
      latitude: 3.119158,
      longitude: 101.674239
    }
    get vehicles_url(params: params), as: :json

    assert_response :success

    json = JSON.parse(@response.body)

    assert json.pluck('is_available').none?
    assert json.pluck('is_verified').none?
    assert json.pluck('deleted_at').none?
  end
end
