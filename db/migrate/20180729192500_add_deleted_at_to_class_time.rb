class AddDeletedAtToClassTime < ActiveRecord::Migration[5.1]
  def change
    add_column :class_times, :deleted_at, :datetime
    add_index :class_times, :deleted_at
  end
end
