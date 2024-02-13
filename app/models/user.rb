class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :categories
  has_many :purchases, foreign_key: 'author_id'
  has_many :category_purchases, through: :purchases
end
