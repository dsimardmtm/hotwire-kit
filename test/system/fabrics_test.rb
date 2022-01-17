require "application_system_test_case"

class FabricsTest < ApplicationSystemTestCase
  setup do
    @fabric = fabrics(:one)
  end

  test "visiting the index" do
    visit fabrics_url
    assert_selector "h1", text: "Fabrics"
  end

  test "should create fabric" do
    visit fabrics_url
    click_on "New fabric"

    fill_in "Name", with: @fabric.name
    click_on "Create Fabric"

    assert_text "Fabric was successfully created"
    click_on "Back"
  end

  test "should update Fabric" do
    visit fabric_url(@fabric)
    click_on "Edit this fabric", match: :first

    fill_in "Name", with: @fabric.name
    click_on "Update Fabric"

    assert_text "Fabric was successfully updated"
    click_on "Back"
  end

  test "should destroy Fabric" do
    visit fabric_url(@fabric)
    click_on "Destroy this fabric", match: :first

    assert_text "Fabric was successfully destroyed"
  end
end
