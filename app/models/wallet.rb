class Wallet < ApplicationRecord
  belongs_to :user
  has_one :statement
  has_many :purchases
end
