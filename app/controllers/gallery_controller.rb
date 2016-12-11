require Rails.root.join('lib/ImgBox.rb')

class GalleryController < ApplicationController
  def init
  	@url = "/gallery/#{params[:id]}/"
  end

  def index
  	@gallery = Gallery.find_by(gallery: params[:id])

    max_width = (params[:width] || 960).to_i
    scale_down = ->(side) {
      if (side >= max_width / 2.0)
        scale_down.(side / 2.0)
      else
        side
      end
    }

    images = @gallery.gallery_images.map do |i|
      big_side = [ i.width, i.height ].max
      factor = scale_down.(big_side) / big_side

      { src: i.image.remote_url,
          w: i.width  * factor,
          h: i.height * factor
      }
    end.shuffle

  	@html = ImgBox.make_gallery(images, max_width)
  end
end
