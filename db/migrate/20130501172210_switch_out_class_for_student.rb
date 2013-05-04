class SwitchOutClassForStudent < ActiveRecord::Migration
 def change
 	remove_column :students, :classification
    add_column :students, :classification, :string
  end
end
