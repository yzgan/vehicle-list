# frozen_string_literal: true

require 'test_helper'

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:one)
  end

  test 'should get index' do
    params = {
      latitude: 3.119158,
      longitude: 101.674239
    }
    get vehicles_url(params: params), as: :json

    assert_response :success
  end

  test 'should create vehicle' do
    assert_difference('Vehicle.count') do
      params = {
        vehicle: {
          mileage_id: @vehicle.mileage_id,
          user_id: @vehicle.user_id,
          vehicle_model_id: @vehicle.vehicle_model_id
        }
      }
      post vehicles_url, params: params, as: :json
    end

    assert_response 201
  end

  test 'should show vehicle' do
    get vehicle_url(@vehicle), as: :json
    assert_response :success
  end

  test 'should update vehicle' do
    params = {
      vehicle: {
        mileage_id: @vehicle.mileage_id,
        user_id: @vehicle.user_id,
        vehicle_model_id: @vehicle.vehicle_model_id
      }
    }
    patch vehicle_url(@vehicle), params: params, as: :json
    assert_response 200
  end

  test 'should destroy vehicle' do
    assert_difference('Vehicle.count', -1) do
      delete vehicle_url(@vehicle), as: :json
    end

    assert_response 204
  end
end
