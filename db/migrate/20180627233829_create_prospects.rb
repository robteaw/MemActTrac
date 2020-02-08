class CreateProspects < ActiveRecord::Migration[5.1]
  def change
    create_table :prospects do |t|
      t.string :fname
      t.string :lname
      t.boolean :showed
      t.boolean :signed_up
      t.date :scheduled_date
      t.references :membership_type, foreign_key: true
      t.references :class_time, foreign_key: true

      t.timestamps
    end
  end
end
