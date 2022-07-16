require "application_system_test_case"

class ProvidersTest < ApplicationSystemTestCase
  setup do
    @provider = providers(:one)
  end

  test "visiting the index" do
    visit providers_url
    assert_selector "h1", text: "Providers"
  end

  test "creating a Provider" do
    visit providers_url
    click_on "New Provider"

    fill_in "Appeal", with: @provider.appeal
    fill_in "Area", with: @provider.area
    fill_in "Company", with: @provider.company
    fill_in "Pcontent", with: @provider.pcontent
    fill_in "Rcontent", with: @provider.rcontent
    fill_in "Rday", with: @provider.rday
    fill_in "Reward", with: @provider.reward
    fill_in "Title", with: @provider.title
    click_on "Create Provider"

    assert_text "Provider was successfully created"
    click_on "Back"
  end

  test "updating a Provider" do
    visit providers_url
    click_on "Edit", match: :first

    fill_in "Appeal", with: @provider.appeal
    fill_in "Area", with: @provider.area
    fill_in "Company", with: @provider.company
    fill_in "Pcontent", with: @provider.pcontent
    fill_in "Rcontent", with: @provider.rcontent
    fill_in "Rday", with: @provider.rday
    fill_in "Reward", with: @provider.reward
    fill_in "Title", with: @provider.title
    click_on "Update Provider"

    assert_text "Provider was successfully updated"
    click_on "Back"
  end

  test "destroying a Provider" do
    visit providers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Provider was successfully destroyed"
  end
end
