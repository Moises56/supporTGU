class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_url, notice: "El usuario se actualizó con éxito."
    else
      render :edit, status: :unprocessable_entity
    end
  end

 
  def index
    @user = User.order(created_at: :desc)
    puts "All Users: #{@user}"
  end

  private
    def user_params
      params.require(:user).permit({role_ids: []})
    end

  # def alluser
  #   @user = User.order(created_at: :desc)
  #   puts "All Users: #{@user}"
  # end
end
