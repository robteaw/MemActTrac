class CreateClassTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :class_times do |t|
      t.string :day_of_week
      t.time :start_time

      t.timestamps
    end
  end
end
