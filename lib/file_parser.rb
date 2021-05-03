class FileParser
  def initialize(cli_args)
    @cli_args = cli_args
  end

  def self.parse(cli_args)
    new(cli_args).parse
  end

  def parse
    if @cli_args.first.to_s.empty?
      'You must provide file name'
    elsif !File.exist?(@cli_args.first.to_s)
      'File not found'
    end
  end
end
