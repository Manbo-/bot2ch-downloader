require "spec_helper"

describe Bot2ch::Downloader::Image do
  describe "#download" do
    let(:dummy) do
      "http://server.fake/image.jpg"
    end

    let(:image) do
      Bot2ch::Downloader::Image.new(dummy)
    end

    let(:save_to) do
      "spec/tmp"
    end

    before do
      Bot2ch::Client.stub(:get).and_return("dummy image")
    end

    after do
      FileUtils.remove_entry(save_to)
    end

    it do
      expect{ image.download(save_to) }.to change{ File.exist?("#{save_to}/image.jpg") }.from(false).to(true)
    end

    context "when imepita" do
      let(:dummy) do
        "http://imepita.jp/0/0/image.jpg"
      end

      it do
        expect{ image.download(save_to) }.to change{ File.exist?("#{save_to}/image.jpg") }.from(false).to(true)
      end

      it do
        expect(image).to receive(:imepita_image!)
        image.download(save_to)
      end
    end
  end
end
