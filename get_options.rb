require 'optparse'

class Parser
  attr_accessor :options

  class << self
    def parse
      new.parse
    end
  end

  def initialize
    @options = {}
  end

  def parse
    OptionParser.new do |parser|
      parser.on("-f", "--filename FILE_NAME",
                "Optional file name for creating new commit") do |file_name|
        options[:file_name] = file_name
      end
      parser.on("-e", "--extension FILE_EXTENSION",
                "Optional file extension for creating new commit") do |file_ext|
        options[:file_ext] = file_ext
      end
      parser.on("-d", "--directory DIRECTORY",
                "Optional directory for creating new commit") do |directory|
        options[:directory] = directory
      end
      parser.on("-n", "--number COMMIT_NUMBER",
                "Number of commits you want to create") do |number|
        options[:number] = number.to_i if number
      end
      parser.on("-t", "--text FILE_TEXT",
                "Optional file text") do |text|
        options[:text] = text
      end
      parser.on("-h", "--help",
                "Prints help message") do |help|
        options[:text] = <<-TEXT

  ruby make_commit.rb <args>

  Usage:

    -f, --filename FILE_NAME
    Optional file name for creating new commit

    -e, --extension FILE_EXTENSION
    Optional file extension for creating new commit

    -d, --directory DIRECTORY
    Optional directory for creating new commit

    -n, --number COMMIT_NUMBER
    Number of commits you want to create

    -t, --text FILE_NAME
    Optional file text

        TEXT
        options[:action] = :print_help
      end
    end.parse!

    # Default values
    options[:file_name] ||= "my_file"
    options[:file_ext] ||= "txt"
    options[:directory] ||= "files"
    options[:number] ||= 1
    options[:text] ||= "I know how to use git"

    results
  end

  def results
    [
      options[:file_name],
      options[:file_ext],
      options[:directory],
      options[:number],
      options[:text],
      options[:action]
    ]
  end
end
