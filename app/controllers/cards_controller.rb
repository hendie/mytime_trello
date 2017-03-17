class CardsController < ApplicationController
  before_action :set_parents
  before_action :set_list_card, only: [:show, :update, :move, :destroy]

  # GET /board/:board_id/lists/:list_id/cards
  def index
    json_response(@list.cards)
  end

  # GET /board/:board_id/lists/:list_id/cards/:id
  def show
    json_response(@card)
  end

  # POST /board/:board_id/lists/:list_id/cards
  def create
    @list.cards.create!(card_params)
    json_response(@list, :created)
  end

  # PUT /board/:board_id/lists/:list_id/cards/:id
  def update
    @card.update(card_params)
    head :no_content
  end

  # PATCH /board/:board_id/lists/:list_id/cards/:id/move/:move_id
  def move
    new_list = @board.lists.find(params[:move_id])
    @card.list = new_list
    @card.save!
    head :no_content
  end

  # DELETE /board/:board_id/lists/:list_id/cards/:id
  def destroy
    @card.destroy
    head :no_content
  end

  private

  def card_params
    params.permit(:title, :move_list_id)
  end

  def set_parents
    @board = Board.find(params[:board_id])
    @list = @board.lists.find(params[:list_id]) if @board
  end

  def set_list_card
    @card = @list.cards.find(params[:id]) if @list
  end
end
