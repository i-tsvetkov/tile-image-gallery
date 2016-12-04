class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :gallery_id, limit: 16, null: false
      t.text   :images, null: false

      t.timestamps
    end
  end
end
