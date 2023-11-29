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
  end
end
