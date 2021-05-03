require_relative 'factories/parser_factory'

class FileParser
  def initialize(cli_args)
    @cli_args = cli_args
  end

  def self.parse(cli_args)
    new(cli_args).parse
  end

  def parse
    file_name = @cli_args.first.to_s

    if file_name.empty?
      'You must provide file name'
    elsif !File.exist?(file_name)
      'File not found'
    else
      parser_for(file_name).process(file_name)
    end
  end

  private

  def parser_for(file_name)
    @parser ||= ParserFactory.get(file_name)
  end
end
