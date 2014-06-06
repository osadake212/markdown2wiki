#! ruby -E Windows-31J:utf-8
# coding: utf-8

require_relative 'converter'

# コマンドライン引数の取得
input_file = ARGV[0]
output_file = ARGV[1]

if input_file.nil? || output_file.nil?
	puts "引数を正しく指定してください。input: #{input_file}, output: #{output_file}"
	return
end

Converter.convert_markdown_to_wiki(input_file, output_file)
