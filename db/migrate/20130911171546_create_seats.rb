class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :row
      t.integer :position
      t.references :student

      t.timestamps
    end
    add_index :seats, :student_id
  end
end
