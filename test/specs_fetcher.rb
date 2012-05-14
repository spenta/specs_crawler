#coding: UTF-8
require_relative 'helper'
require_relative '../lib/specs_fetcher'

describe SpecsCrawler::SpecsFetcher do
  it 'returns an array of text contained in the tags matched by a css selector' do
    @sample_file = File.read 'sample.html', encoding: 'utf-8'
    @fetcher = SpecsCrawler::SpecsFetcher.new @sample_file
    @fetcher.fetch_content('#specs-table tr th span').must_equal ['Type de boîtier', 'Poids en kg', "Taille de l'écran"]
    @fetcher.fetch_content('#specs-table tr td span').must_equal ['Portable - Notebook', '2,6 Kg', '15"'] 
  end
end
