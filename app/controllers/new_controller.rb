class NewController < ApplicationController
  def index
  end

  def upload
  	images = params[:images]
  	gallery_id = 16.times.map { rand(36).to_s(36) }.join
  	images_list = []

  	dir = Rails.root.join('public', 'images', gallery_id)
  	FileUtils.mkdir_p dir

  	images.each do |image|
  		filename = Rails.root.join(dir, image.original_filename)
  		File.open(filename, "wb") do |io|
  			io.write(image.read)
  		end

  		WebP.encode(filename.to_s, "#{filename}.webp")

  		w, h = FastImage.size filename
  		images_list.push({
  			src: "/images/#{gallery_id}/#{image.original_filename}",
  			w: w,
  			h: h
  		})
  	end

  	gallery = Gallery.new
  	gallery.gallery_id = gallery_id
  	gallery.images     = images_list.to_json
  	gallery.save

  	redirect_to "/gallery/#{gallery_id}"
  end
end
