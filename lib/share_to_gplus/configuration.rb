module ShareToGplus
  class Configuration
    attr_accessor :login, :password, :text, :link, :category, :url,
                  :javascript_driver

    def initialize
      @javascript_driver = :selenium # set default driver
      %w(login password text link category url javascript_driver).each do |var|
        instance_variable_set("@#{var}", '')
      end
    end
  end
end
