require 'sinatra'
require 'sinatra/reloader' if development?
require 'aws-sdk'
require 'debugger' if development?

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
  erb :index
end

get '/angry' do
  @imgs = images_for('angry/')
  @emotion = "Rawr! Angry!"
  erb :gifs
end

get '/annoyed' do
  @imgs = images_for('annoyed/')
  @emotion = "Srsly. So annoyed."
  erb :gifs
end

get '/comforting' do
  @imgs = images_for('comforting/')
  @emotion = "No 'fraid, lil soft soft."
  erb :gifs
end

get '/cute' do
  @imgs = images_for('cute/')
  @emotion = "SO PRECIOUS!"
  erb :gifs
end

get '/dancing' do
  @imgs = images_for('dancing/')
  @emotion = "My milkshake brings all the boys to the yard."
  erb :gifs
end

get '/evil' do
  @imgs = images_for('evil/')
  @emotion = "Cackle."
  erb :gifs
end

get '/fuck_you' do
  @imgs = images_for('fuck_you/')
  @emotion = "FUCK YOU MOTHER FUCKER."
  erb :gifs
end

get '/funny' do
  @imgs = images_for('funny/')
  @emotion = "Giggles!"
  erb :gifs
end

get '/happy' do
  @imgs = images_for('happy/')
  @emotion = "Eeeeeeeeeeee!"
  erb :gifs
end

get '/victory' do
  @imgs = images_for('victory/')
  @emotion = "I win."
  erb :gifs
end

get '/whatever' do
  @imgs = images_for('whatever/')
  @emotion = "Whatever whatever."
  erb :gifs
end

get '/wtf' do
  @imgs = images_for('wtf/')
  @emotion = "What. The. FUCK."
  erb :gifs
end
