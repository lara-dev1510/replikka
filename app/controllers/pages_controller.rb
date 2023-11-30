class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def today
    # @looks = Look.all
    user = current_user
    blocked_looks = user.blocked_by
    @looks = Look.all - blocked_looks
    # if @looks.empty?
    # end
    # @outfit = xxxx
  end

  def pieces
    user = current_user
    @pieces = user.pieces
    if params[:query].present?
      # @pieces = @pieces.where("name ILIKE ?", "%#{params[:query]}%")
    #   sql_subquery = <<~SQL
    #   pieces.name @@ :query
    #   OR subcategories.name @@ :query
    #   OR subcategories.color @@ :query
    #   OR subcategories.fabric @@ :query
    # SQL
    # @pieces = @pieces.joins(:subcategory).where(sql_subquery, query: params[:query])
    @pieces = user.pieces.global_search(params[:query])
    end
  end

  private

  def pieces_params
    params.require(:piece).permit(:name, :user_id)
  end
end
