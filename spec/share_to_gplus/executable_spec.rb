require 'spec_helper'
require 'share_to_gplus'

module ShareToGplus
  describe ShareToGplus::Executable do
    subject { ShareToGplus::Executable }

    describe 'self.#invoke' do
      before do
        expect_any_instance_of(ShareToGplus::Executable).to receive(:invoke).and_return(false)
      end

      it { subject.invoke }
    end

    # TODO: finish this
  end
end
