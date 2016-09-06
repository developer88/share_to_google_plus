module ShareToGplus
  class Configuration
    attr_accessor :login, :password, :text, :link, :category, :url,
                  :javascript_driver, :default_gplus_version

    def initialize
      %w(login password text link category url javascript_driver default_gplus_version).each do |var|
        instance_variable_set("@#{var}", nil)
      end
      @default_gplus_version ||= :new # set default Google+ version
      @javascript_driver ||= :selenium # set default driver
    end
  end
end
