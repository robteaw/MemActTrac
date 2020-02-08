class AddLocationColumnsToTables < ActiveRecord::Migration[5.1]
  def change
    add_reference :calls, :location, foreign_key: true
    add_reference :class_attendances, :location, foreign_key: true
    add_reference :class_times, :location, foreign_key: true
    add_reference :employees, :location, foreign_key: true
    add_reference :members, :location, foreign_key: true
    add_reference :membership_types, :location, foreign_key: true
    add_reference :prospects, :location, foreign_key: true
  end
end
