class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.column :size, :string
      t.column :amenities, :string
      t.column :location, :string
    end
  end
end
