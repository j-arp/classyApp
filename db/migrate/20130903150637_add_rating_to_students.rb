class AddRatingToStudents < ActiveRecord::Migration
  def change
    add_column :students, :rating, :integer
  end
end
