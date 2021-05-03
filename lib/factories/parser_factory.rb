class ParserFactory
  def initialize(file_name)
    @file_name= file_name
  end

  def self.get(file_name)
    new(file_name).get
  end

  def get
  end
end
