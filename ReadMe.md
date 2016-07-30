# Create posts in Google+ communities

This gem uses Capybara with *selenium* driver by default to share information in Google+ Communities.

## Usage

### As a gem

Add *share_to_gplus* to your GemFile or just

    gem install share_to_gplus

Require the gem somewhere in your app

    require 'share_to_gplus'

Initialize the gem like

    share_this = ShareToGplus::It.new do |config|
      config.login = 'login from your G+ account here'
      config.password = 'password from your G+ account here'
      config.text = 'text to share'
      config.url = 'Url of G+ community to share post to'
      config.category = 'Category of the post in G+ community'
      config.link = 'Link to be attached to the post'
    end

Finally

    share_this.execute

By default the gem uses *selenium* as a web driver. You can specify capybara-compatible driver if you want to ([poltergeist](https://github.com/teampoltergeist/poltergeist) for example)

    share_this = ShareToGplus::It.new do |config|
      config.javascript_driver = :poltergeist
      ...
    end

### Using CLI


    share_to_gplus --link http://shre_me.com -c CATEGORY -l LOGIN -p PASSWORD -u http://link_to_google_plus_community

More information you can find when execute

    share_to_gplus -h

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
