require_relative 'event'
require 'rspec/autorun'

describe "Reporting an", Event do
  before do
    @event_name = 'Bday Party'
    @event = Event.new(@event_name)
  end

  context "a new event" do
    it "has a name" do
      expect(@event.name).to eql(@event_name)
    end

    it "doesn't have a list of attendees" do
      expect(@event.attendees).to eq([])
    end
  end
end