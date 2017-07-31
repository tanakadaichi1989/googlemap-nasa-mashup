class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  require 'json'
  require 'uri'
  require 'net/http'
  
  uri = URI.parse('https://data.nasa.gov/resource/tfkf-kniw.json')
  json = Net::HTTP.get(uri)
  @result = JSON.parse(json)
  result = JSON.parse(json)
  
end
