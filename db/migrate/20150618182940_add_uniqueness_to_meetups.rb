class AddUniquenessToMeetups < ActiveRecord::Migration
  def up
    change_column :meetups, :name, :string, null: false, unique: true
  end

  def down
    change_column :meetups, :name, :string
  end
end
