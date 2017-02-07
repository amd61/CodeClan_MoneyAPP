require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/tags')
require_relative('controllers/transactions')

get '/' do
  erb( :index )
end
