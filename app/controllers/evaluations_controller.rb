class EvaluationsController < ApplicationController

  def new
    @evaluation = Evaluation.new
    # @organization_user_id = @pet.user_id
  end
  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation = current_user.evaluations.build(evaluation_params)
   
    if @evaluation.save
      redirect_to evaluations_path, notice: "評価を入力しました"
    else
      render :new
    end
  end

def index
  if current_user.present?
    evaluations = Evaluation.all.group_by(&:organization_user_id)
    @averages_by_user = {}
    evaluations.each do |organization_user_id, evaluations|
      @averages_by_user[organization_user_id] = evaluations.map(&:point).sum / evaluations.size
    end 
  else 
    redirect_to root_path
  end

def show
  @evaluations = Evaluation.where(organization_user_id: params[:id])
  @organization_user = User.find(params[:id])
  render :show, locals: { evaluations: @evaluations, organization_user: @organization_user }
end

end

  private

  def evaluation_params
    params.require(:evaluation).permit(:evaluation_comment, :organization_user_id, :point )
  end
end
