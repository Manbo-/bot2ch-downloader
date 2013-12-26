require "pry"

module Bot2ch
  class Downloader
    class Image
      def initialize(image)
        @image = image
      end

      def to_s
        @image
      end

      def download(save_dir, opts = {})
        client = Bot2ch::Client.instance
        override = opts.delete(:override)
        create_directory(save_dir) unless File.exist?(save_dir)
        filename = File.basename(@image)
        save_to = File.join(save_dir, filename)
        if File.exist?(save_to) and override
          puts "override: #{save_to}".color(WARN_COLOR)
        elsif File.exist?(save_to)
          puts "already exist: #{save_to}".color(WARN_COLOR)
          return
        end
        imepita_image! if imepita?
        open(save_to, "wb") do |f|
          puts "download: #{@image}"
          f.print client.get(@image, "Referer" => @image).body
        end
      end

      private

      def create_directory(path)
        puts "create directory: #{path}".color(INFO_COLOR)
        FileUtils.mkdir_p(path)
      end

      def imepita_image!
        image = URI.parse(@image)
        image.path = "/image/#{image.path}"
        @image = image.to_s
      end

      def imepita?
        @image =~ IMEPITA_REGEX
      end
    end
  end
end
