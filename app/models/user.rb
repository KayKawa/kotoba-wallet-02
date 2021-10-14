class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :wallet
  accepts_nested_attributes_for :wallet
  has_many :buys
  has_many :messages
  has_one_attached :image
end
