class ScoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_score, only: %w(show edit update destroy)

  def index
    @scores = current_user.score.all.order("created_at DESC")
  end

  def show
    @log = Log.new
  end

  def new
    @score = Score.new
  end

  def create
    @score = current_user.score.create(score_params)
    if @score.save
      flash[:info] = "楽譜を登録しました"
      redirect_to :scores
    else
      flash.now[:danger] = "楽譜を登録できません"
      render action: :new
    end
  end

  def edit
  end

  def update
    if @score.update_attributes(score_params)
      flash[:info] = "楽譜の情報が編集されました"
      redirect_to :score
    else
      render action: :edit
    end
  end

  def destroy
    @score.destroy!
    flash[:info] = "楽譜を削除しました"
    redirect_to :scores
  end

  private

  def score_params
    params.require(:score).permit(:title, :grade, :start_date, :completion_date, :icon, :status, :point, :remove_icon)
  end

  def set_score
    @score = current_user.score.find(params[:id])
  end
end
