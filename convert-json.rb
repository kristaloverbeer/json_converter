#!/usr/bin/env ruby
require_relative 'src/converter/json_converter'


begin
  print 'Input JSON File path:
  '
  json_file_path = gets.chomp

  print 'Output CSV File path:
  '
  csv_file_path = gets.chomp

  JsonConverter.new.to_csv(json_file_path, csv_file_path)

  puts "File was converted to CSV: #{csv_file_path}"

rescue SystemCallError
  $stderr.print "Input and/or output path given is not correct"
end