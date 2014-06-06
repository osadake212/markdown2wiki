# coding:utf-8

require 'yaml'

require_relative 'markdown_string'

class Converter

	class << self

		# mdからwikiに変換する
		def convert_markdown_to_wiki(markdown, wiki)

			# markdownファイルの存在確認
			unless File.exist?(markdown)
				puts "ファイルが存在しません: #{markdown}"
				return
			end

			# ファイルじゃない場合は終了
			if File.directory?(markdown)
				puts "ファイルではありません: #{markdown}"
				return
			end

			# ファイル読み込み + 変換
			new_text = ""
			File.open(markdown, encoding: "utf-8").each do |line|
				new_text += convert_line(line)
			end

			# ファイル書き込み
			File.open(wiki, 'w:utf-8'){ |f|
				f.write(new_text)
			}

			#puts new_text
		end

		# 1行を変換する
		def convert_line(line)
			line.convert_markdown_to_wiki
		end

	end

end
