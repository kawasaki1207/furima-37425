class Item < ApplicationRecord

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shopping_day

  validates :name, presence: true
  validates :content, presence: true

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shopping_day_id
  end

  validates :price, presence: true
end
