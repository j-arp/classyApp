class AddRepoToStudents < ActiveRecord::Migration
  def change
    add_column :students, :repo, :string
  end
end
