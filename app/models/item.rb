class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_genre
  belongs_to_active_hash :condition_genre
  belongs_to_active_hash :delivery_fee_genre
  belongs_to_active_hash :delivery_area_genre
  belongs_to_active_hash :shipping_day_genre

  validates :title,         presence: true, length: { maximum: 40 }
  validates :text,          presence: true, length: { maximum: 1000 }
  validates :category,      presence: true
  validates :condition,     presence: true
  validates :delivery_fee,  presence: true
  validates :delivery_area, presence: true
  validates :shipping_day,  presence: true
  validates :price,         presence: true, numericality: { with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category,      numericality: { other_than: 1 }
  validates :condition,     numericality: { other_than: 1 }
  validates :delivery_fee,  numericality: { other_than: 1 }
  validates :delivery_area, numericality: { other_than: 1 }
  validates :shipping_day,  numericality: { other_than: 1 }

  validates :image,         presence: true

  belongs_to :user
  has_one_attached :image
end
