class CreateMembershipTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :membership_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
