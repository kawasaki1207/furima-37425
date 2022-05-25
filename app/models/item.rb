class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :shopping_day

  validates :name, presence: true
  validates :content, presence: true

  with_options numericality: { message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :shopping_day_id
  end

  validates :price, presence: true, inclusion: { in: (300..9_999_999) }, numericality: { only_integer: true },
                    format: { with: /\A[0-9]+\z/ }
  validates :image, presence: true
end
