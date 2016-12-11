class CreateGalleryImages < ActiveRecord::Migration[5.0]
  def change
    change_table :galleries do |t|
      t.rename :gallery_id, :gallery
      t.remove :images
  	end

    create_table :gallery_images do |t|
      t.references :gallery, foreign_key: true
      t.string     :image_uid
      t.string     :image_name
      t.integer    :width
      t.integer    :height

      t.timestamps
    end
  end
end
