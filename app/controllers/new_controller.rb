class NewController < ApplicationController
  def index
  end

  def upload
  	images = params[:images]
  	gallery_id = 16.times.map { rand(36).to_s(36) }.join

    gallery = Gallery.new
    gallery.gallery = gallery_id

  	images.each do |image|
      gallery_image = GalleryImage.new

      gallery_image.image  = image.read
      gallery_image.width  = gallery_image.image.width
      gallery_image.height = gallery_image.image.height

      gallery_image.save

      file = Rails.root.join('public', gallery_image.image.remote_url.to_s[1..-1]).to_s
      WebpEncoder.perform_async(file)

      gallery.gallery_images << gallery_image
  	end

  	gallery.save

  	redirect_to "/gallery/#{gallery_id}"
  end
end
