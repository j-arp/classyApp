class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :number
      t.integer :year
      t.references :semester
      t.references :course

      t.timestamps
    end
    add_index :sections, :semester_id
    add_index :sections, :course_id
  end
end
