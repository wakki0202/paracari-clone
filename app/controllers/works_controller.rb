class WorksController < ApplicationController
  before_action :authenticate_provider!,only: [:index,:show,:edit,:update]
  before_action :set_work, only: %i[ show edit update destroy ]

  # GET /works or /works.json
  def index
    @works = Work.all.page(params[:page]).order(:position)
    @work_provider = WorkProvider.all
    @details = Detail.all
    @worknew = Work.new
    @q = Work.ransack(params[:q])
    @works = @q.result(distinct: true).order(:position)
    if current_provider.present? || current_provider.works.id_second.present?
    @introductionnumber = current_provider.works.joins(:introductions).where(introductions: {step: nil}).count
    @introductionall = Introduction.where(step: nil).count
    @detailnumber = current_provider.works.joins(:details).where(details: {status: "未対応"}).count
    @detailnumberall = Detail.where(status: "未対応").count
    end
  end

  def move_top
    @work = Work.find(params[:id]).move_to_top #move_higherメソッドでpositionを上に
    redirect_to action: :index
  end

  def move_higher
    @work = Work.find(params[:id]).move_higher #move_higherメソッドでpositionを上に
    redirect_to action: :index
  end

  def move_lower
    @work = Work.find(params[:id]).move_lower
    redirect_to action: :index
  end

  def move_bottom
    @work = Work.find(params[:id]).move_to_bottom
    redirect_to action: :index
  end

  # GET /works/1 or /works/1.json
  def show
    @work = Work.find(params[:id])
    @provider = @work.provider
    if current_provider.present?
    @introductionnumber = current_provider.works.joins(:introductions).where(introductions: {step: nil}).count
    @introductionall = Introduction.where(step: nil).count
    @detailnumber = current_provider.works.joins(:details).where(details: {status: "未対応"}).count
    @detailnumberall = Detail.where(status: "未対応").count
    end
  end

  # GET /works/new
  def new
    @work = Work.new
  end

  # GET /works/1/edit
  def edit

  end

  # POST /works or /works.json
  def create
    @work = Work.new(work_params)
    @work.provider_id = current_provider.id

    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: "work was successfully created." }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1 or /works/1.json
  def update
     @work = Work.find(params[:id])
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to @work, notice: "work was successfully updated." }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1 or /works/1.json
  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, notice: "work was successfully destroyed." }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_params
      params.require(:work).permit(:title, :company_name, :link, :reward, :pcontent, :rday, :rcontent, :area, :appeal, :status,:id_second,:id_third,:remove_images, :images_cache, images: [])
    end


end
