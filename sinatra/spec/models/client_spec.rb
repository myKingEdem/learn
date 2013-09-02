require 'spec_helper'

describe Client, "#attribiutes" do
	before do
	  @client = Client.new(full_name: "Frank Sinatra", phone_number: "555-sinatra",
	  										 email: "fs@legendary.com", description: "The whole world is a drink behind.")
	end

  it "has a name" do
  	expect(@client.full_name).to eql("Frank Sinatra")
  end

  it "has a phone_number" do
		expect(@client.phone_number).to eql("555-sinatra")
	end

	it "has an email" do
		expect(@client.email).to eql("fs@legendary.com")
	end

	it "has a description" do
		expect(@client.description).to eql("The whole world is a drink behind.")
	end

	it "is valid" do
	  expect(@client).to be_valid
	end
end