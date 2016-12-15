require 'sinatra'
#require 'sinatra/activerecord'
require './environments'
require 'json'
require 'uuid'

get '/' do
  "Welcome"
end

post('/rspec') do
  if (request.env['CONTENT_TYPE'] == 'application/json') && (request.env.has_key? 'HTTP_SUT')
    uuid = UUID.new
    @filename = "#{uuid.generate}"
    payload = JSON.parse(request.body.read)
    Dir.mkdir('results') unless File.exists?('results')
    Dir.mkdir("results/#{request.env['HTTP_SUT'].downcase.gsub(/\s+/, "")}") unless File.exists?("results/#{request.env['HTTP_SUT'].downcase.gsub(/\s+/, "")}")
    File.open("./results/#{request.env['HTTP_SUT'].downcase.gsub(/\s+/, "")}/#{@filename}", 'w') { |file| file.write(payload) }
    status 201
    {"Record": "#{@filename}"}.to_json
  elsif !request.env.has_key? 'HTTP_SUT'
    status 400
    {"Error":"Missing SUT header"}.to_json
  else
    status 406
    {"Error":"Content Type missing"}.to_json
  end

end
