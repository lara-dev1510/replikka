class OutfitsController < ApplicationController
  def show
    @outfit = Outfit.find(params[:id])
    # @pieces = @outfit.pieces
  end
end
