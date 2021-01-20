class MatchesController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:new, :create, :edit, :update, :destroy]
  def index
    @matches = Match.all.order("created_at DESC").page(params[:page]).per(5)
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
    @comment = Comment.new
    @comments = @match.comments.includes(:user)
  end
  
  def edit
  end

  def update
    if @match.update(match_params)
      redirect_to match_path
    else
      render :edit
    end
  end

  def destroy
    @match.destroy
    redirect_to root_path
  end

  def search
    @matches = Match.search(params[:keyword]).order("created_at DESC").page(params[:page]).per(5)
  end

    private

    def match_params
      params.require(:match).permit(:home_team_name, :away_team_name, :home_team_image, :away_team_image, :home_team_score, :away_team_score, :date, :league, :place).merge(user_id: current_user.id)
    end

    def set_item
      @match = Match.find(params[:id])
    end

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
  end
