module Parser
  class Base
    def initialize(file_name)
      @file_name = file_name
    end

    def self.process(file_name)
      new(file_name).process
    end

    def process
      raise NotImplementedError
    end
  end
end
