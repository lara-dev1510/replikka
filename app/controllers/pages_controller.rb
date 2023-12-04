class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :get_weather, only: :today

  def home
  end

  def today
    # @looks = Look.all
    user = current_user
    blocked_looks = user.blocked_by
    if params[:piece]
      @looks = Piece.find(params[:piece]).generate_looks
    else
      @looks = Look.all - blocked_looks
    end
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

  def generate
    user = current_user
    @pieces = user.pieces
    if params[:query].present?
      @pieces = user.pieces.global_search(params[:query])
    end
  end

  private

  def pieces_params
    params.require(:piece).permit(:name, :user_id)
  end

  def get_weather
    response = WeatherClient.new(current_user).get_weather
    @city = response["name"]
    @temp = response["main"]["temp"].round
    @icon_url = "https://openweathermap.org/img/wn/#{response["weather"].first["icon"]}.png"
    @description = response["weather"].first["description"]
  end
end
