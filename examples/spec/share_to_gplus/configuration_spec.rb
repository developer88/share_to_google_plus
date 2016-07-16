require "spec_helper"
require "share_to_gplus"

module ShareToGplus
  describe ShareToGplus::Configuration do
    describe "#login" do
      it "default value is ''" do
        expect(Configuration.new.login).to eq('')
      end
    end

    describe "#login=" do
      it "can set value" do
        config = Configuration.new
        config.login = ''
        expect(config.login).to eq('')
      end
    end
  end
end
