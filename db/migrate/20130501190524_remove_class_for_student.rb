class RemoveClassForStudent < ActiveRecord::Migration
  def up
  	remove_column :students, :classification
  end

  def down
  end
end
