class ScoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_score, only: %w(show edit update destroy)

  def index
    @scores = current_user.score.all.order("created_at DESC")
  end

  def show
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
    if @score.update_attributes(score_params)
      redirect_to :scores
    else
      render action: :edit
    end
  end

  def destroy
    @score.destroy!
    redirect_to :scores
  end

  private

  def score_params
    params.require(:score).permit(:title, :grade, :start_date, :completion_date, :icon, :status, :point)
  end

  def set_score
    @score = current_user.score.find(params[:id])
  end
end
