#!/usr/bin/env ruby
require_relative "version"
require_relative "uri_helper"
require "fileutils"
require "rubygems"
require "anemone"

class Main
    def initialize(webpage, depth)
        @webpage = webpage
        @depth   = depth
    end

    def execute()
        # addd rows to report
        # send to file handler
        
        puts Dir.pwd 
    #     Anemone.crawl(webpage) do |anemone|

    #     anemone.depth_limit = depth.to_i
    #     puts "============= Driller is now checking your website links. If any of the link returned non 200, it will be displayed here========="
    #     anemone.focus_crawl do |page|
    #       page.links.select { |url| url.starts_with? webpage }
    #     end

    #     file = File.new('valid_pages.html', 'w')
    #     file = File.new('broken.html', 'w')
    #     file = File.new('slow_pages.html', 'w')
    #     file = File.new('extremely_slow_pages.html', 'w')

    #     anemone.on_every_page do |page|

    #       if page.code != 200
    #         puts "=======Not 200 OK======\n"
    #         puts page.url
    #         puts "\n returned response code of\n"
    #         puts page.code
    #         puts "\n"
    #         file = File.open('broken.html', 'a+')
    #         file.puts page.url
    #         file.write("\n")
    #         file.write("Returned with response code \n")
    #         file.write("\n")
    #         file.puts page.code
    #       else if
    #         page.code == 200
    #         file = File.open('valid_pages.html', 'a+')
    #         file.puts page.url
    #         file.write("\n")
    #       else if
    #         page.response_time > 5000
    #         puts "=======Slow Page======\n"
    #         puts page.url
    #         file = File.open('slow_pages.html', 'a+')
    #         file.puts page.url
    #         file.write("\n")
    #         file.write("Returned with response time \n")
    #         file.write("\n")
    #         file.puts page.response_time
    #       else if
    #         page.response_time > 10000
    #         puts "=======Very Slow Page======\n"
    #         puts page.url
    #         file = File.open('extremely_slow_pages.html', 'a+')
    #         file.puts page.url
    #         file.write("\n")
    #         file.write("Returned with response time which is not acceptable at all \n")
    #         file.write("\n")
    #         file.puts page.response_time
    #     end
    #     end
    #     end
    #     end
    #     end
        # end
    end
end