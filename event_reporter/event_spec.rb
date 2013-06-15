require_relative 'event'
require 'rspec/autorun'

describe "Reporting an", Event do
  context "a new event" do
    before do
      @event_name = 'Bday Party'
      @event = Event.new(@event_name)
    end

    it "has a name" do
      expect(@event.name).to eql(@event_name)
    end

    it "doesn't have a list of attendees" do
      expect(@event.attendees).to eq([])
    end
  end
end