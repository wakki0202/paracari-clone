class News < ApplicationRecord



  def self.search(search)
      return News.all unless search
      News.where(['title LIKE ?', "%#{search}%"])
    end
end
