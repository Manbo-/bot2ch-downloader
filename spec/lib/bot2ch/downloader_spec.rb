require "spec_helper"

describe Bot2ch::Downloader do
  let(:thread) do
    Bot2ch::Thread.new("http://toro.2ch.net/test/read.cgi/tech/1383742375/")
  end

  let(:downloader) do
    Bot2ch::Downloader.new(thread)
  end

  describe "#images" do
    let(:images) do
      VCR.use_cassette "downloader" do
        downloader.images
      end
    end

    it do
      expect(images).to be_a_kind_of Array
    end

    it do
      expect(images).to be_all{ |image| image.is_a?(Bot2ch::Downloader::Image) }
    end
  end
end
