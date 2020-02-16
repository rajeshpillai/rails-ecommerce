require "application_system_test_case"

class OrderDetailsTest < ApplicationSystemTestCase
  setup do
    @order_detail = order_details(:one)
  end

  test "visiting the index" do
    visit order_details_url
    assert_selector "h1", text: "Order Details"
  end

  test "creating a Order detail" do
    visit order_details_url
    click_on "New Order Detail"

    fill_in "Order", with: @order_detail.order_id
    fill_in "Product", with: @order_detail.product_id
    fill_in "Quantity", with: @order_detail.quantity
    fill_in "Sku", with: @order_detail.sku
    fill_in "Sub total", with: @order_detail.sub_total
    fill_in "Unit price", with: @order_detail.unit_price
    click_on "Create Order detail"

    assert_text "Order detail was successfully created"
    click_on "Back"
  end

  test "updating a Order detail" do
    visit order_details_url
    click_on "Edit", match: :first

    fill_in "Order", with: @order_detail.order_id
    fill_in "Product", with: @order_detail.product_id
    fill_in "Quantity", with: @order_detail.quantity
    fill_in "Sku", with: @order_detail.sku
    fill_in "Sub total", with: @order_detail.sub_total
    fill_in "Unit price", with: @order_detail.unit_price
    click_on "Update Order detail"

    assert_text "Order detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Order detail" do
    visit order_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Order detail was successfully destroyed"
  end
end
