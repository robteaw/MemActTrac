class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :fname
      t.string :lname

      t.timestamps
    end
  end
end
