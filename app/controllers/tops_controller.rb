class TopsController < ApplicationController
  def index
  end
  
  def news
    @news = News.all.page(params[:page])
  end

  def newsshow
    @news = News.find(params[:id])
  end

  def terms
  end

  def policy
  end

  def providercomp
  end

  def destroycomp
  end
end
