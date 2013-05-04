require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:jarp)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_not_nil assigns(:classifications)
    assert_response :success
  end

  test "should create student" do
    
    assert_difference('Student.count') do
      post :create, student: { classification_id: @student.classification_id, first: @student.first, last: @student.last, netid: @student.netid }
    end



    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_not_nil assigns(:classifications)
    assert_response :success
  end


test "should update student without image" do
  
    put :update, id: @student, student: { classification_id: @student.classification_id , first: @student.first, image_file: "", last: @student.last, netid: @student.netid }

    assert_equal "jarpold.jpg", assigns(:student).image, "image field should be netid + ext"
    assert_redirected_to student_path(assigns(:student))

  end


  test "should update student" do
  
  test_image = "test/resources/student.jpg"
  file = Rack::Test::UploadedFile.new(test_image, "image/jpeg")

    put :update, id: @student, student: { classification_id: @student.classification_id , first: @student.first, image_file: file, last: @student.last, netid: @student.netid }

    assert_equal "#{@student.netid}.jpg", assigns(:student).image, "image field should be netid + ext"
    
    assert_redirected_to student_path(assigns(:student))


  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
