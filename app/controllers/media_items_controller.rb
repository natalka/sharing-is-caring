class MediaItemsController < ApplicationController
  before_action :authenticate_user!, except: 'index'

  def index
    @media_items = MediaItem.published
  end

  def create
    @media_item = MediaItem.new(media_item_params)
    if @media_item.save
      render nothing: true, status: :ok
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  private

  def media_item_params
    if params["action"] == "create" && current_user
      params["media_item"]["user_ids"] ||= ["#{current_user.id}"]
    end
    params.require(:media_item).permit(:source_link, :published, :user_ids,
      { user_media_items_attributes: [:id, :media_item_id, :user_id, :owner]})
  end

end
