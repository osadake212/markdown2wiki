# coding: utf-8

require 'yaml'

class MarkdownConfig

	def initialize
		conf_path = "#{File.dirname(__FILE__)}/../config.yml"
		@conf = YAML.load_file(conf_path)
	end

	def get_indent_char
		return @conf['indent_char']
	end
end
