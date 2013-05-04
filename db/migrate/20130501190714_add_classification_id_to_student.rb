class AddClassificationIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :classification_id, :integer
  end
end
