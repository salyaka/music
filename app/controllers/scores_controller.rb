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
    @score = current_user.score.find(params[:id])
  end

  def update
    score = current_user.score.find(params[:id])
    if score.update_attributes(score_params)
      redirect_to :scores
    else
      render action: :edit
    end
  end

  def destroy
    score = current_user.score.find(params[:id])
    score.destroy!
    redirect_to :scores
  end

  private

  def score_params
    params.require(:score).permit(:title, :grade, :start_date, :completion_date, :icon, :status)
  end
end
