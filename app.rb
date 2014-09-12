require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/json'
require 'sinatra/cross_origin'
require 'aws-sdk'
require 'debugger' if development?

AWS.config({
  access_key_id: ENV["AWS_ACCESS_KEY_ID"],
  secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
})

configure do
  enable :cross_origin
end

before do
  @url_prefix = 'https://s3-us-west-2.amazonaws.com/gifgifgiffy/'
end

helpers do
  def json_for(prefix)
    s3 = AWS::S3.new
    bucket = s3.buckets['gifgifgiffy']
    images = bucket.objects.with_prefix(prefix).map(&:key)
    result = images.map do |img|
      img.gsub(".gif", "").split("/")[1]
      img = "#{@url_prefix}#{img}"
    end
    result
  end
end

get '/api/angry.json' do
  imgs = json_for('angry/')
  json imgs
end

get '/api/annoyed.json' do
  imgs = json_for('annoyed/')
  json imgs
end

get '/api/comforting.json' do
  imgs = json_for('comforting/')
  json imgs
end

get '/api/cute.json' do
  imgs = json_for('cute/')
  json imgs
end

get '/api/dancing.json' do
  imgs = json_for('dancing/')
  json imgs
end

get '/api/evil.json' do
  imgs = json_for('evil/')
  json imgs
end

get '/api/fuck_you.json' do
  imgs = json_for('fuck_you/')
  json imgs
end

get '/api/funny.json' do
  imgs = json_for('funny/')
  json imgs
end

get '/api/happy.json' do
  imgs = json_for('happy/')
  json imgs
end

get '/api/nope.json' do
  imgs = json_for('nope/')
  json imgs
end

get '/api/punz.json' do
  imgs = json_for('punz/')
  json imgs
end


get '/api/sad.json' do
  imgs = json_for('sad/')
  json imgs
end

get '/api/victory.json' do
  imgs = json_for('victory/')
  json imgs
end

get '/api/whatever.json' do
  imgs = json_for('whatever/')
  json imgs
end

get '/api/wtf.json' do
  imgs = json_for('wtf/')
  json imgs
end
