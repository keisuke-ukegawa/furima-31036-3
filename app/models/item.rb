class Item < ApplicationRecord
  validates :item_name, presence: true 
  validates :item_description, presence: true 
  validates :category_id, presence: true 
  validates :item_status_id, presence: true 
  validates :price, presence: true 
  validates :shipping_fee_burden_id, presence: true 
  validates :shipping_area_id, presence: true 
  validates :shipping_days_id, presence: true 
  validates :user, presence: true
   
  has_one_attached :image
  has_one :purchase_record
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
end
