# frozen_string_literal: true

module Admin
  class PostsController < Admin::BaseController
    before_action :load_post, except: :index

    def index
      @posts = Post.all
    end

    def show; end

    def update
      @post.update!(content: @post.content_new, active: true, public: true)
      flash[:success] = "The article updated!"
      redirect_to admin_posts_path
    end

    private

    def load_post
      @post = Post.find params[:id]
    end

    def post_update(post)
      post.content = post.content_new
      post.active = true
      post.public = true
    end
  end
end
