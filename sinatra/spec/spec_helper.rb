$: << File.expand_path('../..',__FILE__)
require 'capybara'
require 'capybara/dsl'
require 'rspec'
require 'app'

Capybara.app = App.new

RSpec.configure do |config|
	config.include Capybara::DSL
end