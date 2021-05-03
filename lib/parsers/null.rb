require_relative 'base'

module Parser
  class Null < Base
    def process
      @aggregator
    end
  end
end
