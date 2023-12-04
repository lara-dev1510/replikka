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
    # redirect_to today_path
    # to see all favorites of this user user.all_favorites
  end

  def favorites
    user = current_user
    @favorites = user.all_favorites.order(created_at: :desc)
  end

  # def explore
  #   redirect_to root_path
  #   # @look = Look.find(params[:id])
  #   # user = current_user
  #   # missing piece
  #   # redirect_to outfit_path
  # end

  def explore
    user = current_user
    @pieces = user.pieces
    @look = Look.find(params[:id]) # écrire :look_id?
    @potential_pieces = []
    @subcategories = []
    @categories = []
    # @subcats = {}

    @look.subcategories.each do |subcategory|
      @subcategories << subcategory
      # @subcats ajouter le hash et mettre dedans les valeurs poru faire @subcats = {subcategory_id: [piece_1, piece_2]}
      @pieces.each do |piece|
        if piece.subcategory == subcategory
          @potential_pieces << piece
          @categories << piece.category
          # OutfitPiece.create(piece_id: piece.id, outfit_id: outfit.id)
        end
        @categories_sorted = @categories.sort_by { |cat| cat.position }
      end
    end
    # @pieces_by_cat = @potential_pieces.group_by { |piece| piece.category.name }
    @pieces_by_cat = @potential_pieces.group_by(&:category).sort_by { |k, v| k.position }
    # @pieces_by_cat = @pieces_by_cat_un.sort_by { |cat| Category::CATEGORIES.find { |elem| elem[:name] == cat }.to_h[:position] }.to_h
    # raise
  end

  def explore_large #lui donner un look?
    user = current_user
    @pieces = user.pieces
    @look = Look.find(params[:id]) # écrire :look_id?
    @potential_pieces = []
    @subcategories = []
    @look.subcategories.each do |subcategory|
      @subcategories << subcategory
      @pieces.each do |piece|
        if (piece.subcategory.color == subcategory.color && piece.subcategory.name == subcategory.name)
          @potential_pieces << piece
          # OutfitPiece.create(piece_id: piece.id, outfit_id: outfit.id)
        end
      end
    end
    @outfit = Outfit.new
  # raise
  end

  def unfavorite
    @look = Look.find(params[:id])
    user = current_user
    user.unfavorite(@look)
    redirect_to favorites_path
  end
end
