class CreateConnections < ActiveRecord::Migration
  def change

    create_table :connections do |table|
      table.integer :user_id
      table.integer :meetup_id
    end
  end
end
