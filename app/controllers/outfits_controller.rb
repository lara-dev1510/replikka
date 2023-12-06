class OutfitsController < ApplicationController

  # def new
  #   @outfit = Outfit.new
  # end

  def create
    @look = Look.find(params[:look_id])
    @outfit = Outfit.new(confirmed: true, look_id: @look.id)
    if @outfit.save
      # rattacher les pieces au Outfit
      #@selected_pieces vient du form invisible dans looks/:id/explore
      @selected_pieces = params[:pieces]
      @selected_pieces.each do |piece|
        @piece = Piece.find(piece)
        outfit_piece = OutfitPiece.new
        outfit_piece.piece = @piece
        outfit_piece.outfit = @outfit
        if outfit_piece.save
          @piece.update(worn_stat: @piece.worn_stat + 1 )
        end
      end
      # redirect_to explore_look_path(@look)
      redirect_to outfits_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def show
  #   # @outfit = Outfit.find(params[:id])
  #   # @pieces = @outfit.pieces
  # end

  def index
    # @outfits = Outfit.all
    @outfits = Outfit.all.group_by{ |outfit| outfit.updated_at.to_datetime.cweek }.sort.reverse!
    # @outfits_weekday = Outfit.all.group_by{ |outfit| outfit.updated_at.to_datetime.cwday }
  end
end
