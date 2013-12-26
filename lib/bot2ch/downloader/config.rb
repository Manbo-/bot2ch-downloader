module Bot2ch
  class Downloader
    IMAGE_REGEX      = /\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+/i
    IMEPITA_REGEX    = /\/\/imepita.jp\/\d+\/\d+/i
    IMAGE_EXTENSIONS = /(jpg|jpeg|gif|png)$/
  end
end
