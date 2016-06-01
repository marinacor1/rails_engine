require 'test_helper'

class Api::V1::MerchantItemsControllerTest < ActionController::TestCase
  test "it shows all merchant items" do
    id = Merchant.first.id
    get :index, id: id, format: :json

    assert_response :success
  end
end
