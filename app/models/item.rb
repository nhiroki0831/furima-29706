class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :shipping_day

  validates :title,            presence: true, length: { maximum: 40 }
  validates :text,             presence: true, length: { maximum: 1000 }
  validates :category_id,      presence: true
  validates :condition_id,     presence: true
  validates :delivery_fee_id,  presence: true
  validates :delivery_area_id, presence: true
  validates :shipping_day_id,  presence: true
  validates :price,            presence: true, numericality: { with: /\A[0-9]+\z/, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id,      numericality: { other_than: 1, message: 'を選択してください' }
  validates :condition_id,     numericality: { other_than: 1, message: 'を選択してください' }
  validates :delivery_fee_id,  numericality: { other_than: 1, message: 'を選択してください'}
  validates :delivery_area_id, numericality: { other_than: 1, message: 'を選択してください'}
  validates :shipping_day_id,  numericality: { other_than: 1, message: 'を選択してください'}

  validates :image, presence: {message: 'ファイルを選択してください'}

  belongs_to :user
  has_one :order
  has_one_attached :image
  has_many :comments, dependent: :destroy

  def self.search(search)
    if !search.nil?
      Item.where('title LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
