class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, invite_for: 24.hours


    has_many :introductions, dependent: :destroy
    has_many :works, through: :introductions, dependent: :destroy

    has_many :details, dependent: :destroy
    has_many :works,through: :details, dependent: :destroy

    attr_accessor :current_password


    validates :name, presence: true
    validates :tel, length: { maximum: 14 } 
    validates :account_no, length: { maximum: 25 } 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}
    validates :password, presence: true, on: :create

     def self.search(search)
      return User.all unless search
      User.where(['name LIKE ?', "%#{search}%"])
    end

    # 物理削除の代わりにユーザーの`deleted_at`をタイムスタンプで更新
  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end

  # ユーザーのアカウントが有効であることを確認 
  def active_for_authentication?  
    super && !deleted_at  
  end  

  # 削除したユーザーにカスタムメッセージを追加します  
  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end 
end
