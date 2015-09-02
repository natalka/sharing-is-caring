class CreateUserMediaItems < ActiveRecord::Migration
  def change
    create_table :user_media_items do |t|
      t.belongs_to :user, index: true
      t.belongs_to :media_item, index: true
      t.boolean :owner, default: false

      t.timestamps null: false
    end
  end
end
