class RenameConnectionsToMemberships < ActiveRecord::Migration
  def change
    rename_table :connections, :memberships
  end
end
