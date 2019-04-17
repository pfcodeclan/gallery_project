require('sinatra')
require('sinatra/contrib/all')
require_relative('models/artist')
require_relative('models/exhibit')
also_reload('./models/*')

get '/' do
  erb(:index)
end

get '/artists' do
  @artists = Artist.all
  erb(:artists_list)
end

get '/artists_new' do
  @artists = Artist.all
  erb(:new)
end

post '/artists' do
  Artist.new(params).save
  redirect to '/artists'
end

get '/artists/:id' do
  @artist = Artist.find(params['id'])
  erb(:'artist/show_artist')
end

get '/artists/:id/edit' do
  @exhibits = Exhibit.all
  @artist = Artist.find(params['id'])
  erb(:'artist/edit')
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

# ----

get '/exhibits' do
  @exhibits = Exhibit.all
  erb(:exhibits_list)
end

get '/exhibits/new' do
  @artists = Artist.all
  erb(:new)
end

post '/exhibits' do
  Exhibit.new(params).save
  redirect to '/exhibits_list'
end

get '/exhibits/:id' do
  @exhibit = Exhibit.find(params['id'])
  erb(:'exhibit/show_exhibit')
end

get '/exhibits/:id/edit' do
  @artists = Artist.all
  @exhibit = Exhibit.find(params['id'])
  erb(:'exhibit/edit')
end

post '/exhibits/:id' do
  exhibit = Exhibit.new(params)
  exhibit.update
  redirect to "/exhibits/#{params['id']}"
end

post '/exhibits/:id/delete' do
  exhibit = Exhibit.find(params['id'])
  exhibit.delete
  redirect to '/exhibits_list'
end

get '/about' do
  erb(:about)
end

get '/contact' do
  erb(:contact)
end
