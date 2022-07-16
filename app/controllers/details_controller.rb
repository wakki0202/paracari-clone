class DetailsController < ApplicationController
  before_action :authenticate_user!,only: [:new]
  before_action :authenticate_provider!,only: [:index,:show,:edit,:update]
  before_action :set_detail, only: %i[ show edit update destroy ]

  # GET /details or /details.json
  def index
    @details = Detail.all.page(params[:page]).per(10)
    @q = Detail.all.ransack(params[:q])
    @details = @q.result.page(params[:page]).per(10).order("created_at desc")
    @introductionnumber = current_provider.works.joins(:introductions).where(introductions: {step: nil}).count
    @introductionall = Introduction.where(step: nil).count
    @detailnumber = current_provider.works.joins(:details).where(details: {status: "未対応"}).count
    @detailnumberall = Detail.where(status: "未対応").count
  end

  # GET /details/1 or /details/1.json
  def show
    @detail = Detail.find(params[:id])
    @introductionnumber = current_provider.works.joins(:introductions).where(introductions: {step: nil}).count
    @introductionall = Introduction.where(step: nil).count
    @detailnumber = current_provider.works.joins(:details).where(details: {status: "未対応"}).count
    @detailnumberall = Detail.where(status: "未対応").count
  end

  # GET /details/new
  def new
    @work = Work.find(params[:id])
    @detail = Detail.new
  end

  # GET /details/1/edit
  def edit
  end

  # POST /details or /details.json
  def create
    @work = Work.find(params[:work_id])
    @detail = Detail.new(detail_params)

      if @detail.save
        DetailMailer.detail_introduction(@detail,@work,@current_user).deliver
         redirect_to introductions_complete_path
       
      end
  end

  # PATCH/PUT /details/1 or /details/1.json
  def update
    respond_to do |format|
      if @detail.update(detail_update_params)
        format.html { redirect_to @detail, notice: "Detail was successfully updated." }
        format.json { render :show, status: :ok, location: @detail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1 or /details/1.json
  def destroy
    @detail.destroy
    respond_to do |format|
      format.html { redirect_to details_url, notice: "Detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail
      @detail = Detail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def detail_params
      params.require(:detail).permit(:id,:content,:user_id, :work_id, :status).merge(work_id: params[:work_id],user_id: current_user.id)
    end
    def detail_update_params
      params.require(:detail).permit(:status)
    end
end
