class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_media_items, dependent: :destroy
  has_many :media_items, through: :user_media_items
  has_many :owned_items, -> { where user_media_items: { owner: true } },
           through: :user_media_items, source: :media_item

  accepts_nested_attributes_for :user_media_items

  validates :firstname, presence: true
  validates :lastname, presence: true
end
