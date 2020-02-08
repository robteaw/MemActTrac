class AddDeletedAtToMembershipType < ActiveRecord::Migration[5.1]
  def change
    add_column :membership_types, :deleted_at, :datetime
    add_index :membership_types, :deleted_at
  end
end
