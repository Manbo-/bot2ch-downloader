# Bot2ch::Downloader
[![Build Status](https://travis-ci.org/Manbo-/bot2ch-downloader.png)](https://travis-ci.org/Manbo-/bot2ch-downloader)

## Installation
    $ git clone https://github.com/Manbo-/bot2ch-downloader.git
    $ cd ./bot2ch-downloader
    $ rake install

## Usage

### Command

    bot2ch show http://hoge.2ch.net/test/read.cgi/fuga/8098092/
    bot2ch download http://hoge.2ch.net/test/read.cgi/fuga/8098092/ save_dir
    bot2ch download http://hoge.2ch.net/test/read.cgi/fuga/8098092/ --override
    bot2ch download http://hoge.2ch.net/test/read.cgi/fuga/8098092/ --wait 30
    bot2ch download http://hoge.2ch.net/test/read.cgi/fuga/8098092/ --thread 5

### Default options

~/.bot2ch

    wait: 3
    thread: 5
    override: false
    save_to: /path/to/save_dir


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
