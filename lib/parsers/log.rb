require_relative 'base'

module Parser
  class Log < Base
    def process
      pages = {}
      File.open(@file_name, "r") do |file|
        while(line = file.gets)
          page, ip = line.chomp.split(' ')
          pages[page] ||= []
          pages[page] << ip
        end
      end
      pages
    end
  end
end

