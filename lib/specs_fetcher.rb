module SpecsCrawler
  class SpecsFetcher
    require 'nokogiri'

    def initialize page
      @page = page
      @parsed_page = Nokogiri::HTML page
    end

    def fetch_content selector
      @parsed_page.css(selector).map { |t| t.text.strip }
    end
  end
end
