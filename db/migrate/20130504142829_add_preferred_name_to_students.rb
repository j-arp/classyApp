class AddPreferredNameToStudents < ActiveRecord::Migration
  def change
    add_column :students, :preferred_name, :string
  end
end
