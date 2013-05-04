require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get to_s" do
  	assert_equal "Building Web Applications Spring 2013", sections(:mgti1).to_s
  end
end
