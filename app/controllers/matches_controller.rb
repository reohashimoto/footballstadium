class MatchesController < ApplicationController
  def index
    @matches = Match.all.order("created_at DESC")
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @match = Match.find(params[:id])
  end

    private

    def match_params
      params.require(:match).permit(:home_team_name, :away_team_name, :home_team_image, :away_team_image, :home_team_score, :away_team_score, :date, :league, :place).merge(user_id: current_user.id)
    end
  end
