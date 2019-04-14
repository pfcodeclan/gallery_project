require('sinatra')
require('sinatra/contrib/all')
require_relative('models/artist')
require_relative('models/exhibit')
also_reload('./models/*')

get '/artists' do
  @artists = Artist.all
  erb(:index)
end

get '/artists/new' do
  @exhibits = Exhibit.all
  erb(:new)
end

post '/artists' do
  Artist.new(params).save
  redirect to '/artists'
end

get '/artists/:id' do
  @artist = Artist.find(params['id'])
  erb(:show)
end

get '/artists/:id/edit' do
  @exhibits = Exhibit.all
  @artist = Artist.find(params['id'])
  erb(:edit)
end

post '/artists/:id' do
  artist = Artist.new(params)
  artist.update
  redirect to "/artists/#{params['id']}"
end

post '/artists/:id/delete' do
  artist = Artist.find(params['id'])
  artist.delete
  redirect to '/artists'
end
