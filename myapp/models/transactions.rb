require_relative( '../db/sql_runner' )

class Transactions


  attr_reader( :shop, :value, :id, :tag_id)

  def initialize( options )
    @id = nil || options['id'].to_i
    @shop = options['shop'].capitalize
    @value = options['value']
    @tag_id = options['tag_id']
  end

  def save()
    sql = "INSERT INTO transactions (
      shop, value, tag_id
    ) VALUES (
      '#{ @shop }', #{ @value }, #{ @tag_id }
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run( sql )
    return results.map { |hash| Transactions.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM transactions WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Transactions.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM transactions"
    SqlRunner.run( sql )
  end

  def tag 
    sql = "SELECT * FROM tags WHERE id = #{@tag_id}"
    results = SqlRunner.run( sql )
    return Tags.new (results.first)
  end

end
