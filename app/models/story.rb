class Story < ActiveRecord::Base
  # validates :title, presence: true
  # validates :link, presence: true
  has_many :taggings, :dependent => :delete_all
  has_many :tags, through: :taggings, :dependent => :delete_all
  has_many :depictions, :dependent => :delete_all
  has_many :pictures, through: :depictions, :dependent => :delete_all

  def self.search(query)
    Story.where("title LIKE ?", "%#{query}%")
  end

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
    self.pictures = links.map do |n|
      Picture.where(link: n.strip).first_or_create!
    end
  end


  def excerpt_with_links
    content = self.excerpt
    link = ""
    recording = false
    content_array = []
    link_end_index = 0
    content.each_char.with_index do |chr, i|
      link += chr if recording == true
      if chr == "[" && content[i-1] == "["
        content_array << content[(link_end_index)..(i-2)]
        recording = true
      end
      if content[i+1] == "]" && content[i+2] == "]"
        recording = false
        link_array = link.split(",,")
        link = ""
        label = link_array[0]
        url = link_array[1]
        content_array << "<span class='blog-links'><a href='#{url}' target='_blank'>#{label}  <span class='blog-links-blue'>&#10532</span></a></span> "
        link_end_index = i+3
      end
      if chr == "{" && content[i-1] == "{"
        content_array << content[(link_end_index)..(i-2)]
        recording = true
      end
      if content[i+1] == "}" && content[i+2] == "}"
        recording = false
        note = link
        link = ""
        content_array << "<span class='notes'>#{note}</span>"
        link_end_index = i+3
      end
    end
    content_array << content[(link_end_index)..(-1)]
    return content_array.join
  end

  def null(param = nil)
  end

  alias_method :text_with_links, :null

end
