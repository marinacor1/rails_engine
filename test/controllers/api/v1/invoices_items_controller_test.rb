require 'test_helper'

class Api::V1::InvoiceItemsControllerTest < ActionController::TestCase
  test "it shows all invoice items" do
    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 3, parsed_json.count
  end

  test "it shows a single customer based on id" do
    id = InvoiceItem.first.id
    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal id, parsed_json["id"]
    assert_equal Hash, parsed_json.class
  end


  test "it shows the invoice for an invoice item" do
    id = InvoiceItem.first.id
    get :invoice, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal "shipped", parsed_json["status"]
    assert_equal 298486374,  parsed_json["merchant_id"]
    assert_equal 980190962,  parsed_json["customer_id"]
  end

  test "it shows the item for an invoice item" do
    id = InvoiceItem.first.id
    get :item, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal "Large shiny Tvs", parsed_json["name"]
  end
end
