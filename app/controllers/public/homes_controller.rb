class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all 
    @items = Item.limit(4)# 先頭から5つのレコードから８つを取得
  end

  def about
  end
end
