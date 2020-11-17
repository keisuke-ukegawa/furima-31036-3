class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :item_description
    validates :category_id, numericality: { other_than: 1 }
    validates :item_status_id
    validates :price, format: { with: /[0-9]/ }, inclusion: { in: 300..9_999_999 }
    validates :shipping_fee_burden_id
    validates :shipping_area_id
    validates :shipping_days_id
    validates :image
  end

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  has_one_attached :image
  has_one :purchase_record
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
end
