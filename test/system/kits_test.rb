require "application_system_test_case"

class KitsTest < ApplicationSystemTestCase
  setup do
    @kit = kits(:one)
  end

  test "visiting the index" do
    visit kits_url
    assert_selector "h1", text: "Kits"
  end

  test "should create kit" do
    visit kits_url
    click_on "New kit"

    fill_in "Button", with: @kit.button_id
    fill_in "Fabric", with: @kit.fabric_id
    fill_in "Lining", with: @kit.lining_id
    click_on "Create Kit"

    assert_text "Kit was successfully created"
    click_on "Back"
  end

  test "should update Kit" do
    visit kit_url(@kit)
    click_on "Edit this kit", match: :first

    fill_in "Button", with: @kit.button_id
    fill_in "Fabric", with: @kit.fabric_id
    fill_in "Lining", with: @kit.lining_id
    click_on "Update Kit"

    assert_text "Kit was successfully updated"
    click_on "Back"
  end

  test "should destroy Kit" do
    visit kit_url(@kit)
    click_on "Destroy this kit", match: :first

    assert_text "Kit was successfully destroyed"
  end
end
