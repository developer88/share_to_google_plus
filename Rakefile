require 'capybara/dsl'
require 'capybara/poltergeist'

Capybara.default_driver = :selenium

@login = ""
@password = ""
@text = ""
@link = ""
@category = ""
@community_url = ""

namespace :share do
  task :it do
    include ShareToGPlus
    navigate_to_onceingermany
  end
end

task :default => 'share:it'

module ShareToGPlus
  include Capybara::DSL

  def navigate_to_onceingermany
    visit @community_url
    if(page.has_selector?("a.gb_Me.gb_Ha.gb_rb"))
        login!
    end
    if(page.has_content?('Try the new Google+'))
        try_new_google_plus!
    end
    open_share_dialog
    fill_dialog
    save_record
  end

  def save_record
    find("[data-name='#{@category}']").click
  end

  def add_link
    dialog = find("[role='dialog']")
    dialog.find("div:nth-child(1) div:nth-child(2) textarea").set(@text)
    find(:xpath, '//div[@aria-label="Add link"]').click
    dialog = find(:xpath, '//div[@role="dialog"]')
    dialog.find('input').set(@link)
    dialog.find('input').send_keys :enter
    all("[role='dialog'] div[role='button']")[4].click
  end

  def open_share_dialog
    find(:xpath, '//div[@aria-label="Create a new post"]').click
  end

  def login!
    find("a.gb_Me.gb_Ha.gb_rb").click
    fill_in 'email', :with => @email
    find("input#next").click
    fill_in 'Passwd', :with => @password
    find("input#signIn").click
  end

  def try_new_google_plus!
    find(:xpath, '//div[contains(., "Try the new Google+") and @role="button"]').click
  end
end