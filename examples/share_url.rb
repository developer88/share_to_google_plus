require '../lib/share_to_gplus.rb'

# Fill your actual data here first before running the script
@login = ""
@password = ""
@text = ""
@url = ""
@category = ""
@community_url = ""


puts 'Lets share something to Google+ Community'
sharer = ShareToGplus::It.new(
    {login: @login, password: @password},
    {community_url: @community_url, text: @text, url: @url, category: @category})
puts "And result is #{sharer.execute}"
