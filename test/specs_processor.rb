require_relative 'helper'
require_relative '../lib/specs_processor'

describe SpecsCrawler::SpecsProcessor do
  before do
    @processor = SpecsCrawler::SpecsProcessor.new
  end

  it 'combines the specs array and a values array into a hash' do
    specs = ['screen', 'hdd']
    values = ['17"', '250 GB']

    expected_hash = {'screen' => '17"',
                     'hdd' => '250 GB'} 

    @processor.combine(specs, values).must_equal expected_hash
  end

  it 'combines the specs array and a smaller values array into a hash' do
    specs = ['screen', 'hdd']
    values = ['17"']

    expected_hash = {'screen' => '17"',
                     'hdd' => ''} 

    @processor.combine(specs, values).must_equal expected_hash
  end

  it 'raises an exception when there fewer specs than values' do
    specs = ['screen']
    values = ['17"', '250 GB']

    proc { @processor.combine specs, values }.must_raise SpecsCrawler::ProcessingError
  end

end
