class ChangeMembershipTypesTypeColumn < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      sp_rename 'membership_types.type', 'membership_type', 'COLUMN';

    SQL
  end
end
