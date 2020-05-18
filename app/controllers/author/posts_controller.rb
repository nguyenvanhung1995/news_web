# frozen_string_literal: true

module Author
  class PostsController < Author::BasicController
    before_action :load_post, only: %i[edit update show]
    before_action :load_categories, only: %i[new edit]

    def index
      @posts = Post.all.page(params[:page]).per(10)
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new post_params
      if @post.save
        flash[:success] = "The article was create!"
        redirect_to author_posts_path
      else
        render :new
      end
    end

    def edit; end

    def update
      if @post.update_attributes post_params
        flash[:info] = "The article was update!"
        redirect_to author_posts_path
      else
        render :edit
      end
    end

    private

    def post_params
      params.require(:post).permit :user_id, :title, :header, :content_new,
                                   :public, :category_id, :image, :tag_list, :video
    end

    def load_post
      @post = Post.find params[:id]
    end

    def load_categories
      @category_options = Category.pluck :name, :id
    end
  end
end
