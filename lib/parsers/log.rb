require_relative 'base'
require_relative '../visiting_statistic'

module Parser
  class Log < Base
    def process
      File.open(@file_name, "r") do |file|
        while(line = file.gets)
          page, ip = line.chomp.split(' ')
          @aggregator.add({page => ip})
        end
      end

      @aggregator
    end
  end
end

