class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :image
  
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
 

# 税込価格の表記
  def add_tax_price
    (self.price * 1.1).floor
  end
  
# 商品画像の記述
  def get_image(width, height)
    image.variant(resize: "#{width}x#{height}!").processed
  end
end
