require 'spec_helper'
require 'share_to_gplus'

module ShareToGplus
  describe ShareToGplus::It do
    subject { ShareToGplus::It.new }

    describe '#execute' do

      before do
        expect_any_instance_of(ShareToGplus::It).to receive(:navigate).and_return(true)
        expect_any_instance_of(ShareToGplus::It).to receive(:share).and_return(true)
        expect_any_instance_of(ShareToGplus::Sharer).to receive(:wait_a_little_bit).and_return(true)
      end

      it 'should return true' do
        expect(subject.execute).to be true
      end
    end

    describe '#initialize' do
      before do
        expect(Sharer).to receive(:new).and_call_original
        expect(ShareToGplus).to receive(:configuration).and_call_original
      end

      it { subject }
    end
  end
end
