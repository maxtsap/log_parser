class FileParser
  def self.parse(cli_args)
    new.parse(cli_args)
  end

  def parse(cli_args)
    if cli_args.first.to_s.empty?
      'You must provide file name'
    elsif !File.exist?(cli_args.first.to_s)
      'File not found'
    end
  end
end
