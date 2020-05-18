# frozen_string_literal: true

module Admin
  class UsersController < Admin::BaseController
    before_action :find_user, only: %i[show destroy update edit]

    def show; end

    def index
      @users = User.all.page(params[:page]).per(10)
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Add new user success !"
        redirect_to admin_users_path
      else
        render "new"
      end
    end

    def edit; end

    def update
      if @user.admin? && @user != current_user
        flash[:danger] = "You can not update this person !"
        redirect_to admin_users_path
      elsif @user.update_attributes(user_params)
        flash[:success] = "Update user successfully !"
        redirect_to admin_users_path
      else
        render :edit
      end
    end

    def destroy
      if @user.admin? && @user != current_user
        flash[:danger] = "You can not delete this person !"
      else
        User.find(params[:id]).destroy
        flash[:danger] = "User deleted !"
      end
      redirect_to admin_users_path
    end

    private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit :name, :birthday, :address, :email, :role,
                                   :password, :password_confirmation
    end
  end
end
