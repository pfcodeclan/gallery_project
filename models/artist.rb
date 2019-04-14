require_relative('../db/sql_runner')

class Artist

  attr_accessor :name, :exhibit_id, :price
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @exhibit_id = options['exhibit_id'].to_i
    @price = ['price'].to_i
  end

  def save()
    sql = "INSERT INTO artists
    (
      name,
      exhibit_id,
      price
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @exhibit_id, @price]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def exhibit()
    exhibit = Exhibit.find(@exhibit_id)
    return exhibit
  end

  def update()
    sql = "UPDATE artists
    SET
    (
      name,
      exhibit_id,
      price
      ) =
      (
        $1, $2, $3
        )
        WHERE id = $4"
        values = [@name, @exhibit_id, @price]
        SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artist_data = SqlRunner.run(sql)
    artists = map_items(artist_data)
    return artists
  end

  def self.map_items(artist_data)
    return artist_data.map{|artist| Artist.new(artist)}
  end

    def self.find(id)
      sql = "SELECT * FROM artists
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      artist = Artist.new(result)
      return artist
    end

    def format_name
      return "#{@name.capitalize}"
    end

end
