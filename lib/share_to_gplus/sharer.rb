module ShareToGplus
  class Sharer

    attr_accessor :community_url, :text, :link, :category
    attr_reader :login, :password

    def initialize(login:, password:, community_url:, link:, category: nil, text: nil)
      @community_url = community_url
      @link = link
      @category = category
      @text = text
      @login = login
      @password = password
    end

    def execute
      visit_community
      login
      try_new_google_plus
      open_share_dialog
      #fill_dialog
      #save_record
    end

    private

    def visit_community
      visit @community_url
    end

    def login
      return unless page.has_selector?("a.gb_Me.gb_Ha.gb_rb")

      find("a.gb_Me.gb_Ha.gb_rb").click
      #fill_in 'email', :with => @email
      find("input#next").click
      #fill_in 'Passwd', :with => @password
      find("input#signIn").click
    end

    def try_new_google_plus
      return unless page.has_content?('Try the new Google+')

      find(:xpath, '//div[contains(., "Try the new Google+") and @role="button"]').click
    end

    def open_share_dialog
      find(:xpath, '//div[@aria-label="Create a new post"]').click
    end

  end
end