class AddCurrentGradeToStudents < ActiveRecord::Migration
  def change
    add_column :students, :grade, :string
    add_column :students, :integer, :string
  end
end
