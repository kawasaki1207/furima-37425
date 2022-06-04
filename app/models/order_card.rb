class OrderCard
  include ActiveModel::Model
  attr_accessor :post_code, :city, :address, :building, :tel, :prefecture_id, :buyer, :user, :item, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :tel, format {with: /\A\d{10,11}\z/}
    validates :buyer
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :token, presence: true

  def save
    @buyer = Buyer.create(user: user, item: item)
    @order = Order.create(post_code: post_code, city: city, address: address, building: building, tel: tel,prefecture_id: prefecture_id, buyer: buyer)
  end
end