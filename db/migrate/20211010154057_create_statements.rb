class CreateStatements < ActiveRecord::Migration[6.1]
  def change
    create_table :statements do |t|

      t.timestamps
    end
  end
end
