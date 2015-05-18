#!/usr/bin/env ruby
require_relative "uri_helper"
require_relative "file_handler"
require_relative "html_report"

require "fileutils"
require "rubygems"
require "anemone"

class Main
    attr_accessor :valid, :invalid, :slow, :extremely_slow

    def initialize(webpage, depth, proxy_host, proxy_port)
        @webpage    = webpage
        @depth      = depth
        @proxy_port = proxy_port
        @proxy_host = proxy_host

        @pageCount  = 0

        # initializing symbols
    end

    def execute
        puts "Webpage   : "    + @webpage
        puts "Depth     : "    + @depth

        result = Hash.new
        Anemone.crawl(@webpage) do |anemone|

            unless @proxy_host.nil?
                anemone.proxy_host = @proxy_host
                anemone.proxy_port = @proxy_port
            end

            anemone.depth_limit = @depth.to_i
            puts "============= Driller is now checking your website links. If any of the link returned non 200, it will be displayed here========="
            anemone.focus_crawl do |page|
                page.links.select { |url| url.starts_with? @webpage }
            end


            result[:valid]              = Array.new
            result[:invalid]            = Array.new
            result[:slow]               = Array.new
            result[:extremely_slow]     = Array.new

            anemone.on_every_page do |page|

                pageObject = getPageObject(page)

                if page.code == 200
                    result[:valid].push(pageObject)

                    # Check Response Time
                    # -------------------
                    # We only check response time
                    # for pages which are 200
                    # because there is no point of
                    # optimizing error pages.

                    if page.response_time > 5000
                        result[:slow].push(pageObject)

                        puts "=======Slow Page======\n"
                        puts "Time: #{page.response_time} - #{page.url}"
                    elsif page.response_time > 10000
                        result[:extremely_slow].push(pageObject)

                        puts "=======Very Slow Page======\n"
                        puts "Time: #{page.response_time} - #{page.url}"
                    end
                    #End checking response time.

                else #404, 301, 500
                    result[:invalid].push(pageObject)

                    puts "======= NON-200 Page ======\n"
                    puts "#{page.code} Response from : #{page.url}"
                    puts

                end

            end

            @pageCount = @pageCount + 1
            puts "Checked #{@pageCount} pages" if @pageCount % 100 == 0
        end

        generateReport('valid_pages', result[:valid])
        generateReport('broken', result[:invalid])
        generateReport('slow_pages', result[:slow])
        generateReport('extremely_slow_pages', result[:extremely_slow])

    end

    def getPageObject(page)
        # This means we never got an access to internet
        if page.code.nil?
            abort("Error: Either you are offline or behind proxy.")
        end

        obj = Hash.new

        obj['code']             = page.code
        obj['url']              = (page.url).to_s
        obj['response_time']    = page.response_time

        return obj
    end

    def generateReport(reportName, data)
        report = Html_Report.new(reportName, data)
        File_Handler.new(reportName, report.getReport)
    end
end
