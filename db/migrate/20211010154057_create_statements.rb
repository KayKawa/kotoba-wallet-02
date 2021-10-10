class CreateStatements < ActiveRecord::Migration[6.1]
  def change
    create_table :statements do |t|
      t.references :wallet, foreign_key: true
      t.integer :plus
      t.integer :minus

      t.timestamps
    end
  end
end
