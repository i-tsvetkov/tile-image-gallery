class WebpEncoder
  include Sidekiq::Worker

  def perform(filename)
  	puts filename
    WebP.encode(filename.to_s, "#{filename}.webp")
    puts "end job"
  end
end

