class Story < ActiveRecord::Base
  validates :title, presence: true
  validates :link, presence: true
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :depictions
  has_many :pictures, through: :depictions

  def self.tagged_with(name)
    Tag.find_by_name!(name).stories
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
    joins(:taggings).group("taggings.tag_id")
  end

  def tag_list
    tags.map(&:name).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end


  def self.depicted_with(link)
    Picture.find_by_link!(link).stories
  end

  def self.picture_counts
    Picture.select("pictures.*, count(depictions.picture_id) as count").
    joins(:depictions).group("depictions.picture_id")
  end

  def picture_list
    pictures.map(&:link).join(", ")
  end

  def picture_list=(links)
    self.pictures = links.split(",").map do |n|
      Picture.where(link: n.strip).first_or_create!
    end
  end

end
