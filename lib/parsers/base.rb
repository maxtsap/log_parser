module Parser
  class Base
    def initialize(file_name, aggregator=VisitingStatistic)
      @file_name = file_name
      @aggregator = aggregator.new
    end

    def self.process(file_name)
      new(file_name).process
    end

    def process
      raise NotImplementedError
    end
  end
end
