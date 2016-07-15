module ShareToGplus
  class It

    attr_accessor :config

    def initialize(config = Configuration.new)
      @config = config
      @sharer = ::Sharer.new
    end

    def execute
      sharer.visit_community(url: config.url)
      sharer.login(login: config.login, password: config.password)
      sharer.try_new_google_plus
      sharer.open_share_dialog
      sharer.fill_data(text: config.text, link: config.link)
      sharer.close_dialog
      sharer.set_category(name: config.category)
      return true
    end

  end
end