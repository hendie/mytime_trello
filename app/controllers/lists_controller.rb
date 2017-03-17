class ListsController < ApplicationController
  before_action :set_board
  before_action :set_board_list, only: [:show, :update, :destroy]

  # GET /board/:board_id/lists
  def index
    json_response(@board.lists.includes(:cards).to_json(include: :cards))
  end

  # POST /board/:board_id/lists
  def create
    @list = @board.lists.create!(list_params)
    json_response(@list, :created)
  end

  # GET /board/:board_id/lists/:id
  def show
    json_response(@list.to_json(include: :cards))
  end

  # PUT /board/:board_id/lists/:id
  def update
    @list.update(list_params)
    head :no_content
  end

  # DELETE /board/:board_id/lists/:id
  def destroy
    @list.destroy
    head :no_content
  end

  private

  def list_params
    # whitelist params
    params.permit(:name)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_board_list
    @list = @board.lists.find(params[:id]) if @board
  end
end
