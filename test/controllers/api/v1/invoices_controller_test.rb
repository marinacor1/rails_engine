require 'test_helper'

class Api::V1::InvoicesControllerTest < ActionController::TestCase
  test "it shows all invoice transactions" do
    id = Invoice.first.id
    get :transactions, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert parsed_json.last["credit_card_number"], "1110"
    refute_equal "55556789834",  parsed_json.first["credit_card_number"]
    refute_equal "12345678900", parsed_json.first["credit_card_number"]
  end

  test "it shows all invoice invoice items" do
    id = Invoice.first.id
    get :invoice_items, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert parsed_json.last["quantity"], "3"
    refute_equal "4",  parsed_json.first["quantity"]
    refute_equal "5", parsed_json.first["quantity"]
  end

  test "it shows all invoice items" do
    id = Invoice.last.id
    get :items, id: id, format: :json
    parsed_json = JSON.parse(response.body)
    #TODO do i have any items that belong to this invoice

    assert_response :success

    assert parsed_json.count 2
    assert_equal "Large shiny Tvs",  parsed_json.first["name"]
    assert_equal "Large shiny Tvs",  parsed_json.last["name"]
  end
end
