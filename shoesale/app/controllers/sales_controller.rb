class SalesController < ApplicationController

  def create
    p "CREATE SALE"
    @shoe = Shoe.find(params[:id])
    Sale.create(user:current_user, shoe:@shoe)
    redirect_to '/shoes'
  end
end
