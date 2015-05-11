# Driller

Driller is a command line Ruby based web crawler based on Anemone. Driller can  

* Crawl website and reports error pages which are not 200 or 301. This will report all other HTTP codes.
* Driller will report slow pages which are returned response time > 5000
* This will create three HTML files valid_urls.html which are 200 response. broken.html wich are not 200. slow_pages.html which are retuned reaponse time > 5000



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'driller'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install driller

## Usage

  Driller takes two arguments

  * URL of the page to be crawled
  * Depth of the crawling


          $ driller http://www.example.com 2

  If you have installed it from bundle the

           $ bundle exec driller  http://www.example.com 2


 This will crawl website upto level 2. You can increase depth as per your need. This will create three HTML files valid_urls.html which are 200 response. broken.html wich are not 200. slow_pages.html which are retuned reaponse time > 5000

 You an display these html files to CI server.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/driller/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
