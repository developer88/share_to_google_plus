require 'optparse'

module ShareToGplus
  class Executable
    OPTIONS = [
      %w(login l),
      %w(password p),
      %w(text t),
      %w(url u),
      %w(category c),
      %w(link lnk)
    ].freeze
    MANDATORY_OPTIONS = %w(login password category category)

    attr_accessor :options

    def self.invoke
      executable = new
      executable.invoke if executable.parse_arguments
    end

    def initialize
      @options = {}
    end

    def parse_arguments
      OptionParser.new do |opts|
        opts.banner = 'Usage: sharetogplus [options]'

        OPTIONS.each do |option|
          opts.on("-#{option[1]}", "--#{option[0]}", 'Required option') do |v|
            @options[option[0].to_sym] = v
          end
        end
      end.parse!
      if @options.select{|opt| MANDATORY_OPTIONS.include?(opt) }.size != @options.size
        puts 'Not all arguments provided!'
        return false
      end
      true
    end

    def invoke
      share_this = ShareToGplus::It.new do |config|
        config.login = @options[:login]
        config.password = @options[password]
        config.text = @options[text]
        config.url = @options[community_url]
        config.category = @options[category]
        config.link = @options[url]
      end
      puts "Share to Google+. Status: #{share_this.execute}"
    end
  end
end

