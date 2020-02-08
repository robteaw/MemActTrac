class AddDeletedAtToCall < ActiveRecord::Migration[5.1]
  def change
    add_column :calls, :deleted_at, :datetime
    add_index :calls, :deleted_at
  end
end
