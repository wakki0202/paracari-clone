class WorkProvidersController < ApplicationController
  
  def index
    @work_providers = WorkProvider.all
    @work = Work.find(params[:id])
    @works = Work.all.page(params[:page]).order(:position)
    @work_provider = WorkProvider.all
    @details = Detail.all
    @worknew = Work.new
    @q = Work.ransack(params[:q])
    @works = @q.result(distinct: true).order(:position)
    if current_provider.present?
    @introductionnumber = current_provider.works.joins(:introductions).where(introductions: {step: nil}).count
    @introductionall = Introduction.where(step: nil).count
    @detailnumber = current_provider.works.joins(:details).where(details: {status: "未対応"}).count
    @detailnumberall = Detail.where(status: "未対応").count
    end
  end

  def new
    @work = Work.find(params[:id])
    @work_provider = WorkProvider.new
  end

  def create
     @work = Work.find(params[:work_id])
      @work_provider = WorkProvider.new(
        work_provider_params ) #provider=事業者 #work=案件undefined method `email' for nil:NilClass
      
  
      
      if  @work_provider.save
          redirect_to "/works/#{@work.id}/work_providers/index"
      else
          render :new  #同上
      end
  end

  def work_provider_params

    params.require(:work_provider).permit(:email).merge(work_id: params[:work_id]) #ストロングパラメーターで、
  end 


end
