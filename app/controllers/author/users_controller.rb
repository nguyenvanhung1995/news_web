# frozen_string_literal: true

module Author
  class UsersController < Author::BasicController
    before_action :find_user, only: %i[show update edit]

    def edit; end

    def update
      if @user.update_attributes(user_params)
        flash[:success] = "Update successfully !"
        redirect_to author_posts_path
      else
        render :edit
      end
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
