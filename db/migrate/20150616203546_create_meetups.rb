class CreateMeetups < ActiveRecord::Migration
  def change

    create_table :meetups do |table|
      table.string :name
      table.string :description
      table.string :location
    end
  end
end
