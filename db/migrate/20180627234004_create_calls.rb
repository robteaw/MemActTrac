class CreateCalls < ActiveRecord::Migration[5.1]
  def change
    create_table :calls do |t|
      t.references :member, foreign_key: true
      t.references :employee, foreign_key: true
      t.string :outcome
      t.date :due_date
      t.date :completed

      t.timestamps
    end
  end
end
