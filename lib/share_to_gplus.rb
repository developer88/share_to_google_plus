require "share_to_gplus/version"

module ShareToGplus

  require 'capybara/dsl'
  require 'capybara/poltergeist'

  include Capybara::DSL

  require 'share_to_gplus/sharer'

end
