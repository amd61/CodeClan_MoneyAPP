require_relative( '../models/transactions.rb' )
require_relative( '../models/tags.rb' )

Transactions.delete_all
Tags.delete_all

groceries = Tags.new ({
  'name' => "groceries"

  })

groceries.save

transaction1 = Transactions.new ({
'shop' => "Tesco",
'value' => 1.50,
'tag_id' => groceries.id

  })

transaction1.save