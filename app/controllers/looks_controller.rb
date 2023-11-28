class LooksController < ApplicationController
  def reject
    @look = Look.find(params[:id])
    @look.status = "rejected"
    @look.save
    redirect_to today_path
  end
end
