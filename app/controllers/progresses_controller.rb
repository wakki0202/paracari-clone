class ProgressesController < IntroductionsController
before_action :authenticate_provider!,except: [:index,:show]
before_action :authenticate_user!,only: [:index,:show]
  def index
    @introductions = Introduction.all
  end

  def show
    @introduction = Introduction.find(params[:id])
  end

end
