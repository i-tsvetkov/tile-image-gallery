class WebpEncoder
  include Sidekiq::Worker

  def perform(filename)
    WebP.encode(filename.to_s, "#{filename}.webp",
                lossless: 0,
                quality: 75,
                method: 4)
  end
end

