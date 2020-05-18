# frozen_string_literal: true

module ApplicationHelper
  def categories_list
    @categories_list ||= Category.all
  end

  def first_name(name)
    name.split.first
  end

  def reaction_for(reactionable)
    reactionable.reactions.find_or_initialize_by(user_id: current_user.id)
  end

  def featured_posts
    @featured_posts ||= Impression.where(impressionable_type: "Post").where("created_at >= ? AND created_at <= ?", Date.yesterday, Date.today).group(:impressionable_id).order("count_all DESC").count.first(2)
  end

  def most_in_week
    @most_in_week ||= Impression.where(impressionable_type: "Post").where("created_at >= ? AND created_at <= ?", 7.days.ago, Date.today).group(:impressionable_id).order("count_all DESC").count.first(5)
  end
end
