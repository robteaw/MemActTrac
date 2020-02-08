class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :fname
      t.string :lname
      t.string :phone_number
      t.references :membership_type, foreign_key: true

      t.timestamps
    end
  end
end
