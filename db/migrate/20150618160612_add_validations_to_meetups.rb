class AddValidationsToMeetups < ActiveRecord::Migration
  def up
    change_column :meetups, :name, :string, null: false
    change_column :meetups, :description, :string, null: false
    change_column :meetups, :location, :string, null: false
  end

  def down
    change_column :meetups, :name, :string
    change_column :meetups, :description, :string
    change_column :meetups, :location, :string
  end
end
