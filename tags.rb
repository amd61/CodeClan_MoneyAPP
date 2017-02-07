require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tags.rb' )

get '/tags' do
  @tags = Tags.all()
  erb ( :"tags" )
end

get '/tags/create' do
  erb(:"new_tag")
end

post '/tags' do
  newtag = Tags.new(params)
  newtag.save
  redirect to("/tags")
end