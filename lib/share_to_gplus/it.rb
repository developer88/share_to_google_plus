module ShareToGplus
  class It

    attr_accessor :config

    def initialize
      @config = ShareToGplus.configuration
      yield(@config) if block_given?
      @sharer = Sharer.new(url: config.url)
    end

    def execute
      @sharer.visit_community
      @sharer.login(login: config.login, password: config.password)
      @sharer.try_new_google_plus
      @sharer.open_share_dialog
      @sharer.fill_text(text: config.text)
      @sharer.fill_link(link: config.link)
      @sharer.close_dialog
      @sharer.set_category(name: config.category)
      @sharer.wait_a_little_bit
      return true
    end

  end
end