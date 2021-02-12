class ScoresController < ApplicationController
  before_action :authenticate_user!

  def index
    @scores = current_user.score.all.order("created_at DESC")
  end

  def show
    @score = current_user.score.find(params[:id])
  end

  def new
    @score = Score.new
  end

  def create
    @score = current_user.score.create(score_params)
    if @score.save
      redirect_to :scores
    else
      render action: :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def score_params
    params.require(:score).permit(:title, :grade, :start_date, :completion_date, :icon, :status)
  end
end
