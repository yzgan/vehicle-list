# frozen_string_literal: true

require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:one)
  end

  test 'index returns vehicle list with pagination' do
    params = {
      latitude: 3.119158,
      longitude: 101.674239
    }
    get vehicles_url(params: params), as: :json

    assert_response :success

    json = JSON.parse(@response.body)

    assert_equal 30, json['data'].count
    assert_kind_of Array, json['data']
    assert_includes json['data'].pluck('id'), @vehicle.id.to_s
  end

  test 'index returns defined vehicle list with page params' do
    params = {
      latitude: 3.119158,
      longitude: 101.674239,
      page: 2
    }
    get vehicles_url(params: params), as: :json

    assert_response :success

    json = JSON.parse(@response.body)
    assert json.key?('data')
    assert_equal 30, json['data'].count
    assert_kind_of Array, json['data']
    assert_not_includes json['data'].pluck('id'), @vehicle.id.to_s
  end

  test 'index returns filtered vehicle list' do
    params = {
      latitude: 3.119158,
      longitude: 101.674239
    }
    get vehicles_url(params: params), as: :json

    assert_response :success

    json = JSON.parse(@response.body)

    assert json['data'].pluck('is_available').none?
    assert json['data'].pluck('is_verified').none?
    assert json['data'].pluck('deleted_at').none?
  end

  test 'index response data has valid keys' do
    params = {
      latitude: 3.119158,
      longitude: 101.674239
    }
    get vehicles_url(params: params), as: :json

    assert_response :success

    json = JSON.parse(@response.body)

    key_values = %w[year plate_num transmission latitude longitude
                    return_instruction user_id distance vehicle_id
                    vehicle_model]

    key_values.each do |key|
      assert json.dig('data', 0, 'attributes').key?(key)
    end
  end
end
