     
require 'sinatra' #framework

require 'sinatra/reloader' if development?  
require 'pry' if development? #ruby debug
require 'pg'  #database
require 'httparty'  #API
require 'bcrypt' #password_digest

require_relative 'db/db' 

require_relative 'controllers/diggers_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/weather_controller'


enable:sessions # allow session work
require_relative 'helpers/sessions_helper'

require_relative 'models/digger'
require_relative 'models/user'







