# frozen_string_literal: true

module Author
  class TagsController < Author::BasicController
    def show
      @posts = Post.tagged_with params[:id]
    end
  end
end
