require "application_system_test_case"

class LiningsTest < ApplicationSystemTestCase
  setup do
    @lining = linings(:one)
  end

  test "visiting the index" do
    visit linings_url
    assert_selector "h1", text: "Linings"
  end

  test "should create lining" do
    visit linings_url
    click_on "New lining"

    fill_in "Name", with: @lining.name
    click_on "Create Lining"

    assert_text "Lining was successfully created"
    click_on "Back"
  end

  test "should update Lining" do
    visit lining_url(@lining)
    click_on "Edit this lining", match: :first

    fill_in "Name", with: @lining.name
    click_on "Update Lining"

    assert_text "Lining was successfully updated"
    click_on "Back"
  end

  test "should destroy Lining" do
    visit lining_url(@lining)
    click_on "Destroy this lining", match: :first

    assert_text "Lining was successfully destroyed"
  end
end
