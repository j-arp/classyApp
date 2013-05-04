require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  
  test "get full name" do
  	assert_equal "Jonathan Arp", students(:jarp).full_name
  end


  test "upload image" do 
  	test_image = "test/resources/student.jpg"
    file = Rack::Test::UploadedFile.new(test_image, "jpg")

    result = students(:jarp).upload_image(file)
    assert_equal "jarp.jpg", result, "result should be image named after netid"
  end

end
