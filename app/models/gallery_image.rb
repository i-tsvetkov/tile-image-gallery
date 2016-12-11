class GalleryImage < ApplicationRecord
  belongs_to :Gallery
  dragonfly_accessor :image
end
