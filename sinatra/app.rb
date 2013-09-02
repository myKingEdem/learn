require 'sinatra/base'
require 'sinatra/activerecord'
require './models/client'
require './config/environments'

class App < Sinatra::Base
	get '/' do
		"Hello World"
	end
end