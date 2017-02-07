require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transactions.rb' )

get '/transactions' do
  @transactions = Transactions.all()
  # find @total
  @total = 0.0
  for transaction in @transactions do
    @total = @total + transaction.value.to_f
  end

  erb ( :"transactions" )
end

get '/transactions/delete' do
  Transactions.delete_all
  redirect to("/transactions")
end

get '/transactions/create' do
  @tags = Tags.all()
  erb ( :"new_transaction" )
end

post '/transactions' do
  newtxn = Transactions.new(params)
  newtxn.save
  redirect to("/transactions")
end
