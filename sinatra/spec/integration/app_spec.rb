require 'spec_helper'

describe App, "#landing page" do
	before { visit '/' }

  it "has a paragraph" do
  	expect(page).to have_content('Hello World')
  end
end