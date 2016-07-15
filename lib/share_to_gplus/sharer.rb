module ShareToGplus
  class Sharer

    def visit_community(url:)
      visit url
    end

    def login(login:, password:)
      return unless page.has_selector?("a.gb_Me.gb_Ha.gb_rb")

      find("a.gb_Me.gb_Ha.gb_rb").click
      fill_in 'email', :with => login
      find("input#next").click
      fill_in 'Passwd', :with => password
      find("input#signIn").click
    end

    def try_new_google_plus
      return unless page.has_content?('Try the new Google+')

      find(:xpath, '//div[contains(., "Try the new Google+") and @role="button"]').click
    end

    def open_share_dialog
      find(:xpath, '//div[@aria-label="Create a new post"]').click
    end

    def fill_data(text:, link:)
      dialog = find("[role='dialog']")
      dialog.find("div:nth-child(1) div:nth-child(2) textarea").set(text)
      find(:xpath, '//div[@aria-label="Add link"]').click
      dialog = find(:xpath, '//div[@role="dialog"]')
      dialog.find('input').set(link)
      dialog.find('input').send_keys :enter
    end

    def close_dialog
      all("[role='dialog'] div[role='button']")[4].click
    end

    def set_category(name:)
      find("[data-name='#{name}']").click
    end

  end
end