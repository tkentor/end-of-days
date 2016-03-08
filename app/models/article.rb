class Article < ActiveRecord::Base
  # validates :title, presence: true
  # validates :takeaway, presence: true
  # validates :action, presence: true
  has_many :taggings, :dependent => :delete_all
  has_many :tags, through: :taggings, :dependent => :delete_all
  has_many :depictions, :dependent => :delete_all
  has_many :pictures, through: :depictions, :dependent => :delete_all

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
  def body_with_links
    # method for having links appear in blog body. format is -- [[google, google.com]]
    content = self.body
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
        link_array = link.split(",")
        # split what you recorded into two strings, separated at the comma
        link = ""
        label = link_array[0]
        url = link_array[1]
        # store the first half of what you recorded as variable label, and the second half as variable url
        content_array << "<span class='blog-links'><a href='https://#{url.strip}' target='_blank'>#{label.strip}  <span class='blog-links-blue'>&#10532</span></a></span> "
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


  def body_with_links
    # method for having links appear in blog body. format is -- [[google, google.com]]
    content = self.body
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
        link_array = link.split(",")
        # split what you recorded into two strings, separated at the comma
        link = ""
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

  def takeaway_with_links
    content = self.takeaway
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
        link_array = link.split(",")
        link = ""
        label = link_array[0]
        url = link_array[1]
        content_array << "<span class='blog-links'><a href='#{url.strip}' target='_blank'>#{label.strip}  <span class='blog-links-blue'>&#10532</span></a></span> "
        link_end_index = i+3
      end
    end
      content_array << content[(link_end_index)..(-1)]
      return content_array.join
  end



end
