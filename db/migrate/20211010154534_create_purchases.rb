class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.references :wallet, foreign_key: true
      t.references :statement, foreign_key: true
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end
