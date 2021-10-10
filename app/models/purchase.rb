class Purchase < ApplicationRecord
  belongs_to :wallet
  belongs_to :statement
  attr_accessor :token, :wallet_id, :statement_id, :quantity
end
