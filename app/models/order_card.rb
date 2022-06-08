class OrderCard
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :city, :address, :building, :tel, :prefecture_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :tel, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :user_id
    validates :item_id
    validates :token
  end



  def save
    byuer = Buyer.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, city: city, address: address, building: building, tel: tel, prefecture_id: prefecture_id, byuer_id: byuer.id, token: token)
  end
end