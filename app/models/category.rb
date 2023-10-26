class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  has_many :category_purchases, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :purchases, through: :category_purchases
end
