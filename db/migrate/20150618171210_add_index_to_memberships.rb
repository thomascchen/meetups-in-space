class AddIndexToMemberships < ActiveRecord::Migration
  def change
    add_index :memberships, [:user_id, :meetup_id, :owner], unique: true
  end
end
