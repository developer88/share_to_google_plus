$:.unshift File.dirname(__FILE__) + '/../lib'
require 'share_to_gplus'

# Fill your actual data here first before running the script
@login = ""
@password = ""
@text = "" # Text to be shared
@url = "" # link to be shared
@category = "" # category to be set
@community_url = "" # link to community


puts 'Lets share something to Google+ Community'
share_this = ShareToGplus::It.new do |config|
  config.login = @login
  config.password = @password
  config.text = @text
  config.url = @community_url
  config.category = @category
  config.link = @url
end

puts "And result is #{share_this.execute}"
