module SpecsCrawler
  class ProcessingError < RuntimeError;end

  class SpecsProcessor
    def combine specs, values
      raise ProcessingError.new, 'fewer specs than values' if specs.length < values.length
      values << '' while specs.length > values.length
      Hash[specs.zip values]
    end
  end
end
