class MediaItem < ActiveRecord::Base
  YOUTUBE_REGEX = /\A(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})\z/
  ID_REGEX = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/

  has_many :user_media_items, dependent: :destroy
  has_many :users, through: :user_media_items

  accepts_nested_attributes_for :user_media_items

  validates :source_link, presence: true, format: { with: YOUTUBE_REGEX }

  scope :published, -> { where(published: true) }

  def youtube_id
    source_link.match(ID_REGEX)[1]
  end

end
