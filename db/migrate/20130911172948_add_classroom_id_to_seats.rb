class AddClassroomIdToSeats < ActiveRecord::Migration
  def change
    add_column :seats, :classroom_id, :integer
  end
end
