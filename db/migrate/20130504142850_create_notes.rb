class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :content
      t.references :student

      t.timestamps
    end
    add_index :notes, :student_id
  end
end
