# coding:utf-8

require 'yaml'

require_relative 'markdown_string'

class Converter

	class << self

		# mdからwikiに変換する
		def convert_markdown_to_wiki(markdown, wiki, markdown_config = nil)

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

			begin
				# ファイル読み込み + 変換
				new_text = ""
				File.open(markdown, encoding: "utf-8").each do |line|
					new_text += line.convert_markdown_to_wiki(markdown_config)
				end

				# ファイル書き込み
				File.open(wiki, 'w:utf-8'){ |f|
					f.write(new_text)
				}
			#puts new_text
			rescue
				if $!
					puts 'エラーが発生しました。'
					puts 'エラー内容：'
					puts $!.message				# エラーメッセージ
					puts $!.backtrace			# スタックトレース
					IO.write(ERROR_LOG, [$!.message, $!.backtrace].join("\n"))
				end
			end
		end

	end

end
