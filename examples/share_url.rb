# Fill your actual data here first before running the script
@login = ""
@password = ""
@text = "" # Text to be shared
@url = "" # link to be shared
@category = "" # category to be set
@community_url = "" # link to community


puts 'Lets share something to Google+ Community'
ShareToGplus.configure do |config|
  config.login = @login
  config.password = @password
  config.text = @text
  config.url = @community_url
  config.category = @category
  config.link = @url
end

sharer = ShareToGplus::It.new
puts "And result is #{sharer.execute}"
