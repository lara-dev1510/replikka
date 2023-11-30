class OutfitsController < ApplicationController

  # def new
  #   @outfit = Outfit.new
  # end

  def create
    raise
    @look = Look.find(params[:id])
    @outfit = Outfit.new(confirmed: true, look_id: @look.id)
    # rattacher les pieces au Outfit
    # attacher user id in schema
    @outfit.user = current_user

 # @selected_pieces vient du form invisible
    @selected_pieces.each do |piece|
      outfit_piece = OutfitPiece.new
      outfit_piece.piece = piece
      outfit_piece.outfit = @outfit
      outfit_piece.save
    end

    if @outfit.save
      redirect_to explore_path(@look)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def show
  #   # @outfit = Outfit.find(params[:id])
  #   # @pieces = @outfit.pieces
  # end

end
