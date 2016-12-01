require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'json'
require 'uuid'

class Testplan < ActiveRecord::Base
end

get '/' do
  puts "Welcome"
end

post '/rspec' do

  if request.env['CONTENT_TYPE'] == 'application/json'
    uuid = UUID.new
    @filename = "#{uuid.generate}"
    payload = JSON.parse(request.body.read)
    
    Dir.mkdir('results') unless File.exists?('results')
    puts payload.class
    File.open("./results/#{@filename}", 'w') {|file| file.write(payload)}

    content = File.read("./results/#{@filename}")
    status 201
    message = {"Record": "#{@filename}"}.to_json
  else
    status 406
  end

end
