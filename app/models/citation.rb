class Citation < ActiveRecord::Base
  belongs_to :article
  belongs_to :story
end
