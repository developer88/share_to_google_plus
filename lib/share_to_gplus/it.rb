module ShareToGplus
  class It

    def initialize(*args)
        @credentials = args.shift
        @data = args.shift
    end

    def execute
        sharer = ::Sharer.new(
            login: @credentials[:login],
            password: @credentials[:password],
            community_url: @data[:community_url],
            text: @data[:text],
            url: @data[:url],
            category: @data[:category]
        )
        sharer.execute
    end

  end
end