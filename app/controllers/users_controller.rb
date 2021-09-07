class UsersController < ApplicationController
  
  def edit
    
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:family_name, :last_name, :phone_number, :company_name, :position_id, :email)
  end
end
