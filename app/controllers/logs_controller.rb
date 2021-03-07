class LogsController < ApplicationController
  before_action :authenticate_user!
  
  def create 
    @score = Score.find(params[:score_id])
    @log = @score.logs.create(log_params)
    if @log.save
      flash[:info] = "練習記録を登録しました"
      redirect_to score_path(@score)
    else
      flash.now[:danger] = "練習記録を登録できません"
      render template: "scores/show"
    end
  end
  
  def destroy
    @log = Log.find(params[:id])
    @score = @log.score
    @log.destroy!
    flash[:info] = "練習記録を削除しました"
    redirect_to score_url(@score)
  end

  def index
    @logs = Log.all
  end

  private

  def log_params
    params.require(:log).permit(:content, :start_time)
  end
end
