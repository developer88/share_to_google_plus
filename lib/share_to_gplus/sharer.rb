module ShareToGplus
  require 'capybara/dsl'
  require 'capybara/poltergeist'

  class Sharer

    include Capybara::DSL

    def initialize(url: "", config: ShareToGplus.configuration)
      @url = url
      Capybara.configure do |capybara_config|
        capybara_config.run_server = false
        capybara_config.default_driver = config.javascript_driver.to_sym
        capybara_config.app_host = url
        capybara_config.default_max_wait_time = 10
        capybara_config.raise_server_errors = false
      end
      @config = config
    end

    def visit_community
      visit @url
      page.current_window.resize_to(1280, 1024)
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
      return if !page.has_selector?("div.Ege.qMc") && @config.default_gplus_version == :new
      if @config.default_gplus_version == :old && page.has_selector?(".d-k-l.b-c.b-c-Wa")
        find(".d-k-l.b-c.b-c-Wa", visible: :all).click
        wait_a_little_bit
        @config.default_gplus_version = :new # We changed version
      end
    end

    def open_share_dialog
      find("div.jXDCJf.Tek5Ce.BDrJf").click if @config.default_gplus_version == :new
      find("div.kqa.es").click if @config.default_gplus_version == :old
    end

    def fill_text(text:)
      if @config.default_gplus_version == :new
        dialog = find("[role='dialog']")
        dialog.find("div:nth-child(1) div:nth-child(2) textarea").set(text)
      else
        find("div.df.b-K.b-K-Xb.URaP8").send_keys(text)
      end
    end

    def fill_link(link:)
      if @config.default_gplus_version == :new
        find(:xpath, '//div[@aria-label="Add link"]').click
        dialog = find(:xpath, '//div[@role="dialog"]')
        dialog.find('input').set(link)
        dialog.find('input').send_keys :enter
      else
        find("span.d-s.ph.pZ").click
        wait_a_little_bit
        find("div.MR input.fm").set(link)
      end
    end

    def close_dialog
      find(:xpath, '//span[contains(., "Post")]').click if @config.default_gplus_version == :new
    end

    def set_category(name:)
      find(:xpath, "//div[@data-name='#{name}']").click if @config.default_gplus_version == :new
      if @config.default_gplus_version == :old
        find("div.BA.pi.d-e.d-k-l.d-r-c").click
        find(:xpath, "//div[@class='An zr d-r']/div[@class='Vm d-A']//span[. = 'Test']/../..").click
        find("div.d-k-l.b-c.b-c-Ba.qy.jt").click
      end
    end

    def wait_a_little_bit
      sleep(5)
    end

  end

  #require 'share_to_gplus/sharer/old_g'
  #require 'share_to_gplus/sharer/new_g'
end
