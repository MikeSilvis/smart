require 'spec_helper'

describe Smart::Process do
  subject { Smart::Process.new }
  before { Smart::StoredCalendarEvents.new << event }
  let(:event) { double(id: 321, start_time: start_time, end_time: end_time, hangout_link: 'http://mikesilvis.com') }
  let(:start_time) { (Time.now - 300) }

  describe '.current' do
    let(:end_time) { Time.now + 300 }
    it { subject.current[:id].should == event.id }
  end

  describe '.old_events' do
    context 'when an event is old' do
      let(:end_time) { Time.now - 100 }
      it { subject.old_event.should == true }
    end

    context 'when an event is not old' do
      let(:end_time) { Time.now + 300 }
      it { subject.old_event.should == false }
    end
  end
end
