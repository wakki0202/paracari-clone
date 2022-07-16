class Detail < ApplicationRecord
  belongs_to :work, optional: true, foreign_key: "work_id"
  belongs_to :user, optional: true, foreign_key: "user_id"
  

  def self.search(search)
      return Detail.all unless search
      Detail.where(['title LIKE ?', "%#{search}%"])
    end
end
