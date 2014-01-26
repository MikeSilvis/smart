require 'spec_helper'

describe Puller do
  subject { Puller.new }

  context 'handles a hangout process in the browser' do
    it { subject.open_hangout }
  end

end
