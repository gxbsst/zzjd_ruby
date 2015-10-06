class CRailsAdminsController < ::RailsAdmin::MainController

  def update
    @model_name = to_model_name(params[:model_name])
    model = @model_name.singularize.classify.constantize
    record = model.find(params[:id])
    key = params[:model_name].split('~').join('_')
    unlocked_params = ActiveSupport::HashWithIndifferentAccess.new(params[key])

    if record.update(unlocked_params)
      redirect_to params[:return_to]
    end
  end

  def delete
    @model_name = to_model_name(params[:model_name])
    model = @model_name.singularize.classify.constantize

    if model.find(params[:id]).delete
      redirect_to params[:return_to]
    end

  end
end