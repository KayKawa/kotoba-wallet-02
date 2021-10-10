class CreateBuys < ActiveRecord::Migration[6.1]
  def change
    create_table :buys do |t|
      t.references :giver, foreign_key: { to_table: :users }
      t.references :taker, foreign_key: { to_table: :users }
      t.references :wallet, foreign_key: true
      t.references :statement, foreign_key: true
      t.integer :quantity, null: false
      t.integer :unit_price, null: false

      t.timestamps
    end
  end
end
