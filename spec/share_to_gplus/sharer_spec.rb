require 'spec_helper'
require 'share_to_gplus'

module ShareToGplus
  describe ShareToGplus::Sharer do
    subject { ShareToGplus::Sharer }

    describe '#initialize' do
      before do
        expect(Capybara).to receive(:configure).and_call_original
      end

      it { subject.new }
    end

    # TODO: Finish this
  end
end
