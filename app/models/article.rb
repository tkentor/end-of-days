class Article < ActiveRecord::Base
  validates :title, presence: true
  validates :takeaway, presence: true
  validates :action, presence: true
end
