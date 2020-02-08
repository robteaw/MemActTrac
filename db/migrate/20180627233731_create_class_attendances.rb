class CreateClassAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :class_attendances do |t|
      t.references :class_time, foreign_key: true
      t.date :date
      t.integer :attendance

      t.timestamps
    end
  end
end
