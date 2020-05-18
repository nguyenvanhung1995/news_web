# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def index
    @recent_posts = Post.where(active: true).last(8)
    @categories_index = Category.all.includes(:posts).limit(4)
    @tags = Tag.all.last(5)
    most_in_week[0].nil? ? (@most_read_1 = Post.last(4)[0]) : (@most_read_1 = Post.find(most_in_week[0][0]))
    most_in_week[1].nil? ? (@most_read_2 = Post.last(4)[1]) : (@most_read_2 = Post.find(most_in_week[1][0]))
    @most_read_3 = most_in_week[2].nil? ? Post.last(4)[2] : Post.find(most_in_week[2][0])
    @most_read_4 = most_in_week[3].nil? ? Post.last(4)[3] : Post.find(most_in_week[3][0])
    @featured_post_1 = featured_posts[0].nil? ? Post.last(2)[0] : Post.find(featured_posts[0][0])
    @featured_post_2 = featured_posts[1].nil? ? Post.last(2)[1] : Post.find(featured_posts[1][0])
  end
end
