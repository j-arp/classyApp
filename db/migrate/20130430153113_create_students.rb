class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first
      t.string :last
      t.string :netid
      t.integer :classification
      t.string :image
      t.references :section

      t.timestamps
    end
    add_index :students, :section_id
  end
end
