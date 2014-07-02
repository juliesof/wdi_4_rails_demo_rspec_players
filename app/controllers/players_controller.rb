class PlayersController < ApplicationController

  def index
    @players = Player.order(:name)
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.save!
    redirect_to root_path
  end

  def player_params
    params.require(:player).permit(:name, :job, :health, :magic)
  end
end
