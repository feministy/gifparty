require 'sinatra'
require 'sinatra/reloader' if development?
require 'aws-sdk'
require 'slim'
require 'debugger'

AWS.config({
  access_key_id: ENV["AWS_ACCESS_KEY_ID"],
  secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
})


before do
  @url_prefix = 'https://s3-us-west-2.amazonaws.com/gifgifgiffy/'
end

helpers do
  def images_for(prefix)
    s3 = AWS::S3.new
    bucket = s3.buckets['gifgifgiffy']
    images = bucket.objects.with_prefix(prefix).map(&:key)
    hash = {}
    images.each do |img|
      i = img.gsub(".gif", "").split("/")[1]
      hash[i] = "#{@url_prefix}#{img}"
    end
    hash
  end
end

get '/' do
  slim :index
end

get '/angry' do
  @imgs = images_for('angry/')
  @emotion = "Rawr! Angry!"
  erb :gifs
end

get '/wtf' do
  @imgs = images_for('wtf/')
  @emotion = "What. The. FUCK."
  erb :gifs
end
