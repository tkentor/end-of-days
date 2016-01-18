class Article < ActiveRecord::Base
  # validates :title, presence: true
  # validates :takeaway, presence: true
  # validates :action, presence: true
  has_many :taggings, :dependent => :delete_all
  has_many :tags, through: :taggings, :dependent => :delete_all
  has_many :depictions, :dependent => :delete_all
  has_many :pictures, through: :depictions, :dependent => :delete_all

  resourcify

  def self.tagged_with(name)
    Tag.find_by_name!(name).articles
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
    Picture.find_by_link!(link).articles
  end

  def self.picture_counts
    Picture.select("pictures.*, count(depictions.picture_id) as count").
    joins(:pictures).group("depictions.picture_id")
  end

  def picture_list
    pictures.map(&:link).join(", ")
  end

  def picture_list=(links)
    self.pictures = links.map do |n|
      Picture.where(link: n.strip).first_or_create!
    end
  end

end
