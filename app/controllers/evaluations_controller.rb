class EvaluationsController < ApplicationController
  def new
    @evaluation = Evaluation.new
  end
  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation = current_user.evaluations.build(evaluation_params)
    if @evaluation.save
      redirect_to root_path, notice: "評価を入力しました"
    else
      render :new
    end
  end
  private

  def evaluation_params
    params.require(:evaluation).permit(:evaluation_comment, :organization_user_id,  :point )
  end
end

