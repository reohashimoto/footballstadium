class NewmatchesController < ApplicationController
  def index
    @newmatches = Newmatch.all.order("created_at DESC").page(params[:page]).per(5)
  end
end
