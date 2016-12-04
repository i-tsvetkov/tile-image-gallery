require Rails.root.join('lib/ImgBox.rb')

class GalleryController < ApplicationController
  def init
  	@url = "/gallery/#{params[:id]}/"
  end

  def index
  	@gallery = Gallery.find_by(gallery_id: params[:id])
  	@html    = ImgBox.make_gallery(
  				 JSON.parse(@gallery["images"])
  				 	 .map(&:symbolize_keys)
  				 	 .shuffle,
  				 (params[:width] || 960).to_i)
  end
end
