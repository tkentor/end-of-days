class Article < ActiveRecord::Base
  # validates :title, presence: true
  # validates :takeaway, presence: true
  # validates :action, presence: true
  has_many :taggings, :dependent => :delete_all
  has_many :tags, through: :taggings, :dependent => :delete_all
  has_many :depictions, :dependent => :delete_all
  has_many :pictures, through: :depictions, :dependent => :delete_all

  def self.search(query)
    Article.where("title LIKE ?", "%#{query}%")
  end

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

# create method for having links appear in body text
  def text_with_links(content)
    # method for having links appear in blog body. format is -- [[google, google.com]]
    # variable "content" refers to the body from the rails form
    link = ""
    # variable "link" is an empty string
    recording = false
    # no need to record anything yet
    content_array = []
    # create empty array with name "content_array"
    link_end_index = 0
    # current index is 0
    content.each_char.with_index do |chr, i|
      # assign an index number to each character in the variable content
      link += chr if recording == true
      # add the characters to the link variable if recording
      if chr == "[" && content[i-1] == "["
        # if the character [ is reached, and the character with an index value +1 is also [,
        content_array << content[(link_end_index)..(i-2)]
        recording = true
        # then start recording, and push everything before it into the content_array
      end
      if content[i+1] == "]" && content[i+2] == "]"
        # if you reach the closing brackets,
        recording = false
        # then stop recording.
        link_array = link.split(",,")
        # split what you recorded into two strings, separated at the comma
        link = ""
        # resets link to zero so it doesn't repeat
        label = link_array[0]
        url = link_array[1]
        # store the first half of what you recorded as variable label, and the second half as variable url
        content_array << "<span class='blog-links'><a href='#{url.strip}' target='_blank'>#{label.strip}  <span class='blog-links-blue'>&#10532</span></a></span> "
        # now put variables label and url into this html tag like so
        link_end_index = i+3
        # resume on the third characters after the link ended, because ]] are the first two
      end
    end
      content_array << content[(link_end_index)..(-1)]
      # push the rest of the body after the link into the content array
      return content_array.join
      # join all strings of the content array, again into one cohesive body text
  end





  def null
  end

  alias_method :excerpt, :null
  alias_method :link, :null
  alias_method :source, :null

end
