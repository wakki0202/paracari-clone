class Users::InvitationsController < Devise::InvitationsController
  def new
    @users = User.all
    super
    
  end

  def create
    @users = User.all
    super
 if @user.save
   introductions_complete_path
 elsif 
   new_user_invitation_path
 end
   
    
    

  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end
end