class MediaItem < ActiveRecord::Base
  YOUTUBE_REGEX = /\A(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})\z/
  validates :source_link, presence: true, format: { with: YOUTUBE_REGEX }

end
