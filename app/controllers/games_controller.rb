class GamesController < ApplicationController
  before_action :admin_user, only: [:new,:create,:destroy]
  # GET /games
  # games_path
  def index
  	@games = Game.paginate page: params[:page], :per_page => 5
  end

  # GET /games/new
  # new_game_path
  def new
  	@game = Game.new
  end

  # GET /game/{id}
  # game_path(game)
  def show
  	@game = Game.find(params[:id])
  end

  # POST /games
  # games_path
  def create
  	@game = Game.new(game_params)
    if @game.save
      flash[:success] = "New game added!"
      redirect_to games_path
    else
      render 'new'
    end
  end

  # DELETE /games/{id}
  # game_path(game)
  def destroy
  	Game.find(params[:id]).destroy
    flash[:success] = "Game deleted"
    redirect_to games_path
  end

  private
  	def game_params
  		params.require(:game).permit(:name,:publisher,:description,:picture)
  	end

  	def admin_user
      redirect_to(games_path) unless current_user.admin?
    end

end
