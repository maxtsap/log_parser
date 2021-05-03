require_relative '../parsers/null'
require_relative '../parsers/log'

class ParserFactory
  PARSERS = {
    '.log' => Parser::Log
  }

  def initialize(file_name)
    @file_name= file_name
  end

  def self.get(file_name)
    new(file_name).get
  end

  def get
    PARSERS[File.extname(@file_name)] || Parser::Null
  end
end
