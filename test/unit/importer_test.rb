require 'test_helper'

class ImporterTest < ActiveSupport::TestCase
  
  def setup
  	@importer = Importer.new
  	@importer.src = 'test/resources/students.csv'
  end

  test "content exists" do
    assert_not_nil @importer.content
    #puts @importer.content
  end

  test "file exists" do
    assert_not_nil @importer.file
    assert_not_equal 0, @importer.file.length
    #puts @importer.file
  end

  test "get array of hashes" do
    assert_instance_of Array, @importer.array , "should be an array"
    #puts  @importer.array
    assert_instance_of Hash, @importer.array[0] , "should be an hash"
    #puts @importer.array[1]
    assert_equal "test1", @importer.array[0][:netid]
    assert_equal "test2", @importer.array[1][:netid]
  end

end
