require 'test_helper'

class Api::V1::MerchantsControllerTest < ActionController::TestCase
  test "it shows all merchant items" do
    get :index, format: :json

    assert_response :success
  end
end
