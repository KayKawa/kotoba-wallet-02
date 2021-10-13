class AddWalletidToWallets < ActiveRecord::Migration[6.1]
  def change
    add_column :wallets, :wallet_name, :string
  end
end
