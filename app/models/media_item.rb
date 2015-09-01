class MediaItem < ActiveRecord::Base
  validates :source_link, presence: true
end
