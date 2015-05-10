module Driller

  class Crawler

    URL = ARGV[0]
    Anemone.crawl(URL) do |anemone|

  anemone.depth_limit = 2

  anemone.focus_crawl do |page|
    page.links.select { |url| url.starts_with? URL }
  end

  file = File.new('valid_pages.html', 'w')
  file = File.new('broken.html', 'w')
  file = File.new('slow_pages.html', 'w')

  anemone.on_every_page do |page|

    if page.code = 200 && page.code = 301
      file = File.open('valid_pages.html', 'a')
      file.puts page.url
    end

    if page.code != 200 && page.code != 301
      puts "=======broken======\n"
      puts page.url
      file = File.open('broken.html', 'a')
      file.puts page.url
    end


    if page.response_time > 5000
      puts "=======Slow Page======\n"
      puts page.url
      file = File.open('slow_pages.html', 'a')
      file.puts page.url
    end

  end

end
  end
end
