if ARGV.first.to_s.empty?
  puts 'You must provide file name'
elsif !File.exist?(ARGV.first.to_s)
  puts 'File not found'
end
