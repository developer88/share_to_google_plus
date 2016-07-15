module ShareToGplus

  class Configuration
    attr_accessor :login, :password, :text, :link, :category, :url, :link

    def initialize
      %w{login password text link category url, linkk}.each do |var|
        instance_variable_set("@#{var}", "")
      end
    end
  end

end
