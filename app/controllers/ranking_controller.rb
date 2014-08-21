class RankingController < ApplicationController

  def new
    @rank = Ranking.new
  end

  def create
    @rank = Ranking.new(rank_params)
    if @rank.save
      redirect_to(new_session_path, notice: 'Rank successful')
    else
      render 'new'
    end
  end

  def show
    @rank = Ranking.find(params[:id])
  end


  private 
  def rank_params
    params.require(:ranking).permit(:id, :doable_id, :doable_type, :list_id, :rank) 

  end

end
end
