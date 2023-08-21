class CreateItemReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :item_reservations do |t|
      t.references :item, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
