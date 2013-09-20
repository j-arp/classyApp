require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  
  test "get full name" do
    #puts students(:jarp)
  	assert_equal "Jonathan Arp", students(:jarp).full_name
  end

  test "get color based on grade" do 
    assert_equal "green", students(:jarp).temperature
    assert_equal "red", students(:larp).temperature
  end

=begin
  test "get repo url" do 
    assert_equal "https://itmlab-web.business.nd.edu/svn/mgti-40660-Spring2013/students/jarp", students(:jarp).repo_url
  end
  test "upload image" do 
  	test_image = "test/resources/student.jpg"
    file = Rack::Test::UploadedFile.new(test_image, "jpg")
    result = students(:jarp).upload_image(file)
    assert_equal "jarp.jpg", result, "result should be image named after netid"
  end
=end

  test "generate a password" do 
    puts "password is #{students(:jarp).generate_password}"
    assert_not_nil students(:jarp).generate_password, "password was not generated"
    assert_equal 6, students(:jarp).generate_password.length, "password should be 6 chars"
  end
end
