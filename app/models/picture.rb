class Picture < ActiveRecord::Base
  has_many :depictions
  has_many :articles, through: :depictions
  has_many :stories, through: :depictions

  # def pieces
  #   articles = Article.order("created_at DESC")
  #   stories = Story.order("created_at DESC")
  #   i = 0
  #   if articles.length < stories.length
  #     short_array = articles
  #     long_array = stories
  #   else
  #     short_array = stories
  #     long_array = articles
  #   end
  #   result = []
  #   short_array.each do | item |
  #     if long_array[i].created_at > item.created_at
  #       result << long_array[i]
  #       i += 1
  #     elsif long_array[i].created_at < item.created_at
  #       result << item
  #       i += 1
  #       next
  #     else
  #       result << long_array[i]
  #       result << item
  #       i += 1
  #       next
  #     end
  #     redo
  #   end
  #   result
  # end

end
