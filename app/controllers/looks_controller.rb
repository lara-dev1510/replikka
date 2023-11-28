class LooksController < ApplicationController
  def reject
    @look = Look.find(params[:id])
    # @look.status = "rejected"
    # @look.save
    # redirect_to today_path
    user = current_user
    @look.block(user)
    redirect_to today_path
  end

  def favorite
    @look = Look.find(params[:id])
    user = current_user
    user.favorite(@look)
    redirect_to today_path
  end

  # def unfavorite
  #   @look = Look.find(params[:id])
  #   user = current_user
  #   user.unfavorite(@look)
  # end
end
