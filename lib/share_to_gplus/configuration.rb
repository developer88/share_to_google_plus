module ShareToGplus

  class Configuration
    attr_accessor :login, :password, :text, :link, :category, :url

    def initialize
      %w{login password text link category url}.each do |var|
        instance_variable_set("@#{var}", "")
      end
    end
  end

end
