# frozen_string_literal: true

require 'test_helper'

class VehicleManufacturersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle_manufacturer = vehicle_manufacturers(:one)
  end

  test 'should get index' do
    get vehicle_manufacturers_url, as: :json
    assert_response :success
  end

  test 'should create vehicle_manufacturer' do
    assert_difference('VehicleManufacturer.count') do
      params = { vehicle_manufacturer: { name: @vehicle_manufacturer.name } }
      post vehicle_manufacturers_url, params: params, as: :json
    end

    assert_response 201
  end

  test 'should show vehicle_manufacturer' do
    get vehicle_manufacturer_url(@vehicle_manufacturer), as: :json
    assert_response :success
  end

  test 'should update vehicle_manufacturer' do
    params = { vehicle_manufacturer: { name: @vehicle_manufacturer.name } }
    patch vehicle_manufacturer_url(@vehicle_manufacturer),
          params: params, as: :json
    assert_response 200
  end

  test 'should destroy vehicle_manufacturer' do
    assert_difference('VehicleManufacturer.count', -1) do
      delete vehicle_manufacturer_url(@vehicle_manufacturer), as: :json
    end

    assert_response 204
  end
end
