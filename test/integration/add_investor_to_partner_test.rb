require "test_helper"

class AddInvestorToPartnerTest < ActionDispatch::IntegrationTest
  include Rails.application.routes.url_helpers

  setup do
    @partner = Partner.create(name: "Acme")
  end

  test "add investor to partner" do
    get partner_investors_path(@partner)
    assert_response :success
    assert_select "a", text: "Add New Investor"

    get new_partner_investor_path(@partner)
    assert_response :success

    assert_difference("Investor.count", 1) do
      post partner_investors_path(@partner), params: {
        investor: {
          first_name: "John",
          last_name: "Doe",
          date_of_birth: "1980-01-01",
          phone_number: "1234567890",
          addresses_attributes: {
            "0" => {
              street: "123 Main St",
              state: "NY",
              zip_code: "10001"
            }
          }
        }
      }
    end

    follow_redirect!
    assert_response :success
    assert_match "Investor was successfully created", response.body
    assert_match "Create Investo", response.body
  end

  test "add investor to partner with invalid phone" do
    get partner_investors_path(@partner)
    assert_select "a", text: "Add New Investor"
    get new_partner_investor_path(@partner)

    assert_difference("Investor.count", 0) do
      post partner_investors_path(@partner), params: {
        investor: {
          first_name: "John",
          last_name: "Doe",
          date_of_birth: "1980-01-01",
          phone_number: "12",
          addresses_attributes: {
            "0" => {
              street: "123 Main St",
              state: "NY",
              zip_code: "10001"
            }
          }
        }
      }
    end

    assert_response 422
    assert_match "Phone number must be 10 digits", response.body
  end
end
