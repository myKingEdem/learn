require 'rspec/autorun'
require_relative 'person'

describe Person do
  before do
    @personal_info = { id: 0, first_name: 'first_name', last_name: 'last_name' }
    @contact_info = { email_address: 'email@example.com', homephone: '2074133142' }
    @address = { street: '2003 Townsend Avenue', city: 'Nashville', state: 'TN', zipcode: '09845' }
    @rsvp_date = { day: '10/11/12', time: '09:08' }

    @attendee = Person.new(@personal_info, @contact_info, @address, @rsvp_date)
  end

  context "creating an attendee" do
    it "is an instance of Person" do
      expect(@attendee.instance_of?(Person)).to eql(true)
    end

    it "has a valid personal_info" do
      expect(@attendee.personal_info).to_not eql({})
    end

    it "has a valid contact_info" do
      expect(@attendee.contact_info).to_not eql({})
    end

    it "has a valid address" do
      expect(@attendee.address).to_not eql({})
    end

    it "has a valid rsvp_date" do
      expect(@attendee.rsvp_date).to_not eql({})
    end
  end

  context "retrieving a persons info" do
    it "returns the right first_name from the personal info" do
      expect(@attendee.personal_info[:first_name]).to eql('first_name')
    end

    it "returns the right phone_number from the contact_info" do
      expect(@attendee.contact_info[:homephone]).to eql('2074133142')
    end

    it "returns the right city from the address" do
      expect(@attendee.address[:city]).to eql('Nashville')
    end

    it "returns the right day from rsvp_date" do
      expect(@attendee.rsvp_date[:day]).to eql('10/11/12')
    end
  end
end