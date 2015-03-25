class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.column :date, :datetime
      t.column :price, :float
      t.belongs_to :user, index: true
      t.belongs_to :room, index: true
    end
  end
end
