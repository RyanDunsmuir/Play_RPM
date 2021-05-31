class CreateOrderSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :order_songs do |t|
      t.references :order, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
