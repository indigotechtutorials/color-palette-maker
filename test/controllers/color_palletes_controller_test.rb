require "test_helper"

class ColorPalletesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @color_pallete = color_palletes(:one)
  end

  test "should get index" do
    get color_palletes_url
    assert_response :success
  end

  test "should get new" do
    get new_color_pallete_url
    assert_response :success
  end

  test "should create color_pallete" do
    assert_difference("ColorPallete.count") do
      post color_palletes_url, params: { color_pallete: { name: @color_pallete.name } }
    end

    assert_redirected_to color_pallete_url(ColorPallete.last)
  end

  test "should show color_pallete" do
    get color_pallete_url(@color_pallete)
    assert_response :success
  end

  test "should get edit" do
    get edit_color_pallete_url(@color_pallete)
    assert_response :success
  end

  test "should update color_pallete" do
    patch color_pallete_url(@color_pallete), params: { color_pallete: { name: @color_pallete.name } }
    assert_redirected_to color_pallete_url(@color_pallete)
  end

  test "should destroy color_pallete" do
    assert_difference("ColorPallete.count", -1) do
      delete color_pallete_url(@color_pallete)
    end

    assert_redirected_to color_palletes_url
  end
end
