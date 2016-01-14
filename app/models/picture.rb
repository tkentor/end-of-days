class Picture < ActiveRecord::Base
  has_many :depictions
  has_many :articles, through: :depictions
  has_many :stories, through: :depictions
end
