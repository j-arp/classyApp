require 'test_helper'

class BatchControllerTest < ActionController::TestCase

  def setup
    @section = sections(:mgti1)
    @teststudents = sections(:mgti1).students
  end

  test "should get index" do
    get :index
    assert_not_nil assigns(:sections)
    assert_response :success

  end

  test "should get import" do

    test_file = "test/resources/students.csv"
    file = Rack::Test::UploadedFile.new(test_file, "text/csv")

    get :import ,{:file =>file, :section_id => @section.id}

    assert_not_nil assigns(:students)    
    assert_response :success
  
  end

  test "should clear out records first" do

    test_file = "test/resources/nostudents.csv"
    file = Rack::Test::UploadedFile.new(test_file, "text/csv")
    get :import ,{:file =>file, :clear => true, :section_id => @section.id}
    puts @teststudents[0].full_name
    assert_equal 0, @teststudents.count

  
  end

 
  test "should get clear" do
    get :clear
    assert_response :success
  end

end
