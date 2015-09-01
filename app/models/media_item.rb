class MediaItem < ActiveRecord::Base
  YOUTUBE_REGEX = /\A(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})\z/
  ID_REGEX = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
  validates :source_link, presence: true, format: { with: YOUTUBE_REGEX }

  def youtube_id
    source_link.match(ID_REGEX)[1]
  end

end
