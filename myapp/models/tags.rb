require_relative( '../db/sql_runner' )

class Tags


  attr_reader( :id, :name)

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO tags (
      name
    ) VALUES (
      '#{ @name }'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tags"
    results = SqlRunner.run( sql )
    return results.map { |hash| Tags.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM tags WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Tags.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM tags"
    SqlRunner.run( sql )
  end

  def total 
    sql = "SELECT * FROM transactions WHERE tag_id=#{id}"
    results = SqlRunner.run( sql )
    @total = 0.0
    for txn in results do
      @total = @total + txn['value'].to_f
    end
    return @total

  end

end
