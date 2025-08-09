require "application_system_test_case"

class ColorPalletesTest < ApplicationSystemTestCase
  setup do
    @color_pallete = color_palletes(:one)
  end

  test "visiting the index" do
    visit color_palletes_url
    assert_selector "h1", text: "Color palletes"
  end

  test "should create color pallete" do
    visit color_palletes_url
    click_on "New color pallete"

    fill_in "Name", with: @color_pallete.name
    click_on "Create Color pallete"

    assert_text "Color pallete was successfully created"
    click_on "Back"
  end

  test "should update Color pallete" do
    visit color_pallete_url(@color_pallete)
    click_on "Edit this color pallete", match: :first

    fill_in "Name", with: @color_pallete.name
    click_on "Update Color pallete"

    assert_text "Color pallete was successfully updated"
    click_on "Back"
  end

  test "should destroy Color pallete" do
    visit color_pallete_url(@color_pallete)
    accept_confirm { click_on "Destroy this color pallete", match: :first }

    assert_text "Color pallete was successfully destroyed"
  end
end
