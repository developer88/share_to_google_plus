module ShareToGplus
  require 'capybara/dsl'
  require 'capybara/poltergeist'

  class Sharer

    include Capybara::DSL

    def initialize(url: "")
      @url = url
      Capybara.configure do |config|
        config.run_server = false
        config.default_driver = :selenium
        config.app_host = url
      end
    end

    def visit_community
      visit @url
    end

    def login(login:, password:)
      return unless page.has_selector?("#gb_70")

      find("#gb_70").click
      fill_in 'email', :with => login
      find("input#next").click
      fill_in 'Passwd', :with => password
      find("input#signIn").click
    end

    def try_new_google_plus
      find(:xpath, '//div[contains(., "Try the new Google+") and @role="button"]').click
      sleep(5)
    end

    def open_share_dialog
      find(:xpath, '//div[@aria-label="Create a new post"]').click
    end

    def fill_text(text:)
      dialog = find("[role='dialog']")
      dialog.find("div:nth-child(1) div:nth-child(2) textarea").set(text)
      find(:xpath, '//div[@aria-label="Add link"]').click
    end

    def fill_link(link:)
      dialog = find(:xpath, '//div[@role="dialog"]')
      dialog.find('input').set(link)
      dialog.find('input').send_keys :enter
    end

    def close_dialog
      find(:xpath, '//span[contains(., "Post")]').click
    end

    def set_category(name:)
      find(:xpath, "//div[@data-name='Test']").click
    end

    def wait_a_little_bit
      sleep(5)
    end

  end
end