class UsersController < ApplicationController
before_action :authenticate_user!,only: [:news,:destroy,:mypage]
require 'csv'

  def index
    @users = User.all.page(params[:page]).per(10)
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).order("created_at asc")    
    @introductionnumber = current_provider.works.joins(:introductions).where(introductions: {step: nil}).count
    @introductionall = Introduction.where(step: nil).count
    @detailnumber = current_provider.works.joins(:details).where(details: {status: "未対応"}).count
    @detailnumberall = Detail.where(status: "未対応").count
     # respond_to はリクエストに応じた処理を行うメソッドです。
    # 通常時はhtmlをリクエストしているので、処理は記述していません。
    # viewのlink_toでformatをcsvとして指定しているので、
    # リンクを押すとsend_posts_csv(@posts)の処理を行います。
    respond_to do |format|
      format.html
      format.csv do |csv|      
      @users = User.all
        send_users_csv(@users)
      end
    end
  end

  

 def confirm

 end

    def complete
        @user = User.find(params[:id])
    end

    def mypage
      @user = User.find(params[:id])
      redirect_to(tops_index_path) unless @user == current_user
      @works = Work.order("RANDOM()").limit(6)

    end

    def show
    @user = User.find(params[:id])
    @introductionnumber = current_provider.works.joins(:introductions).where(introductions: {step: nil}).count
    @introductionall = Introduction.where(step: nil).count
    @detailnumber = current_provider.works.joins(:details).where(details: {status: "未対応"}).count
    @detailnumberall = Detail.where(status: "未対応").count
  end

      

      def news

      end

      
   
      def destroy

      end

      def destroycomp

      end

    private

     def send_users_csv(users)
      bom = "\uFEFF"
    # CSV.generateとは、対象データを自動的にCSV形式に変換してくれるCSVライブラリの一種
    csv_data = CSV.generate(bom) do |csv|
      # %w()は、空白で区切って配列を返します
      column_names = %w(ID 作成日 退会日 名前 電話番号 eメール 出身 生年月日 ラインID 銀行 支店 口座種類 口座番号  経歴 アピールポイント )
      # csv << column_namesは表の列に入る名前を定義します。
      csv << column_names
      # column_valuesに代入するカラム値を定義します。
      users.each do |user|
        column_values = [
          user.id,
          user.created_at,
          user.deleted_at,
          user.name,
          user.tel,
          user.email,
          user.residence,
          user.birth_date,
          user.line_id,
          user.bank,
          user.branch,
          user.account_type,
          user.account_no,
          user.career,
          user.appeal
                ]
        csv << column_values
       
      end
    end
    # csv出力のファイル名を定義します。
    send_data(csv_data, filename: "ユーザー一覧.csv")
  end



end
