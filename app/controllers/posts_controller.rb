class PostsController < WorksController
before_action :authenticate_provider!,except: [:index,:show]
  
  def index　#ユーザー側投稿一覧
    @works = Work.all.page(params[:page]).order(:position)
    @q = Work.ransack(params[:q])
    @works = @q.result(distinct: true).order(:position)
    
  end

  def show　#ユーザー側投稿詳細
     @work = Work.find(params[:id])
     @introduction = Introduction.new
  end
  



end
