require 'spec_helper'

describe Smart::StoredCalendarEvents do
  subject { Smart::StoredCalendarEvents.new }

  describe '.<<' do
    let(:event) { double(id: 123, start_time: Time.now, end_time: Time.now + 300, hangout_link: 'http://mikesilvis.com') }
    it { expect { subject << event }.to change{subject.events.size}.by(1) }

    context 'only adds uniq items' do
      before { subject << event }
      it { expect { subject << event }.to change{subject.events.size}.by(0) }
    end

    context 'can add an array of items' do
      let(:event_2) { double(id: 124, start_time: Time.now, end_time: Time.now + 300, hangout_link: 'http://mikesilvis.com') }
      it { expect { subject << [event, event_2] }.to change{subject.events.size}.by(2) }
    end
  end

  describe '.delete_old_events' do
    let(:event) { double(id: 132, start_time: (Time.now - 5000), end_time: Time.now - 4000, hangout_link: 'http://mikesilvis.com') }
    before { subject << event }
    it { expect { subject.delete_old_events }.to change{subject.events.size}.by(-1) }
  end

end
