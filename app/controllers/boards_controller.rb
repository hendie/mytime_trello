class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :destroy]

  # GET /boards
  def index
    @boards = Board.all
    json_response(@boards)
  end

  # POST /boards
  def create
    @board = Board.create!(board_params)
    json_response(@board, :created)
  end

  # GET /boards/:id
  def show
    json_response(@board.to_json(include: { lists: { include: :cards } }))
  end

  # PUT /boards/:id
  def update
    @board.update(board_params)
    head :no_content
  end

  # DELETE /boards/:id
  def destroy
    @board.destroy
    head :no_content
  end

  private

  def board_params
    # whitelist params
    params.permit(:title, :created_by)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end
