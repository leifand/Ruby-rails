class ShoesController < ApplicationController

  def index
    @shoes = Shoe.where.not(:user_id => current_user.id)
    #@shoes = Shoe.where.not(:user_id => current_user.id)
    # Idea.joins(:likes).order('count(likes.id) DESC')
    # Idea.joins(:likes)
    # Idea.joins(left join likes on likes.idea_id = secrets.id').group(:id).order('count likes.id desc')
    # Idea.all.sort{|a, b| b.likes.count <=> a.likes.count}
  end

  def create
    @shoe = Shoe.new(shoe_params)
    if @shoe.save
        flash[:notice] = ["A New Shoe Is Ready For Sale!"]
        return redirect_to :back
    end
    errors = @shoe.errors.full_messages
    flash[:errors] = errors
    return redirect_to :back
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def dashboard
    @my_shoes = Shoe.where(:user_id => current_user.id)
    @my_sales = Shoe.all
    @my_purchases = Shoe.all
    @total_sold = 5000.00
    @total_purchased = 0.99
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    if @shoe.user == current_user
      @shoe.destroy
    end
    redirect_to :back
  end

  private def shoe_params
    params.require(:shoe).permit(:description, :price).merge(user: current_user)
  end
end
