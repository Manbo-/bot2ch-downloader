require "bot2ch"
require "rainbow"

require "bot2ch/downloader/image"
require "bot2ch/downloader/config"
require "bot2ch/downloader/colors"
require "bot2ch/downloader/version"

module Bot2ch
  class Downloader
    def initialize(thread)
      @thread = thread
    end

    def images
      images = urls.select do |url|
        url =~ IMAGE_EXTENSIONS
      end
      images.map do |image|
        Image.new(image)
      end
    end

    private

    def urls
      @thread.posts.map do |post|
        post.body.scan(IMAGE_REGEX).map do |url|
          "http:#{url}"
        end
      end.flatten
    end
  end
end
