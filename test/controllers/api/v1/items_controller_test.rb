require 'test_helper'

class Api::V1::ItemsControllerTest < ActionController::TestCase
  test "it shows all items" do
    get :index, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 4, parsed_json.count
  end

  test "it shows a single item based on id" do
    id = Item.first.id
    get :show, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal id, parsed_json["id"]
    assert_equal "You can watch things on them", parsed_json["description"]
    assert_equal Hash, parsed_json.class
  end

  test "it find first item by unit price" do
    price = Item.first.unit_price
    get :find, unit_price: price, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal "2.32", parsed_json["unit_price"]
    assert_equal Hash, parsed_json.class
  end

  test "it shows all instances of items based on updated at" do
    updated_at = Item.first.updated_at
    get :find_all, updated_at: updated_at, format: :json
    parsed_json = JSON.parse(response.body)
    assert_response :success
    assert_equal 3, parsed_json.group_by {|block| block["name"]}.keys.count
  end

  test "it shows all instances of items based on id" do
    id = Item.first.id
    get :find_all, id: id, format: :json
    parsed_json = JSON.parse(response.body)
    assert_response :success
    assert_equal Array, parsed_json.class
    assert_equal id, parsed_json.first['id']
  end

  test "it shows the invoice item for an item" do
    id = Item.first.id
    get :invoice_items, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_equal 4, parsed_json.first["quantity"]
    assert_equal "12.34",  parsed_json.first["unit_price"]
    assert_equal 298486374,  parsed_json.first["id"]
  end

  test "it shows an items merchant" do
    id = Item.first.id
    get :merchant, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal "Mr.Merchant", parsed_json["name"]
  end

  test "it shows an items best day" do
    skip
    id = Item.first.id
    get :best_day, id: id, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal "01-01", parsed_json
  end

  test "it shows most items by total sold" do
    get :most_items, quantity: 3, format: :json
    parsed_json = JSON.parse(response.body)

    assert_response :success
    assert_equal 3, parsed_json.count
  end

end
