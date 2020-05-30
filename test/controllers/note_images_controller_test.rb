require 'test_helper'

class NoteImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get note_images_create_url
    assert_response :success
  end

  test "should get destroy" do
    get note_images_destroy_url
    assert_response :success
  end

end
