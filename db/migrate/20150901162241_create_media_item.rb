class CreateMediaItem < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.string :source_link
      t.boolean :published, default: false
      t.timestamps
    end
  end
end
