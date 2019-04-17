require_relative('../database/sql_runner')
require_relative('exhibit')

class Artist
  attr_accessor(:name, :category, :id)
  attr_reader(:name, :category, :id)

  def initialize(options)
    # @id = options['artist_id'].to_i if options['artist_id']
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @category = options['category']
  end

  def self.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map {|artist|Artist.new(artist)}
  end

  def save()
    sql = "INSERT INTO artists
    (
      name,
      category
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @category]
    results = SqlRunner.run(sql, values)
    @id = results.first()['artist_id'].to_i
  end

  def update()
    sql = "UPDATE artists
    SET
    (
      name,
      category
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@name, @category, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Artist.new(results.first)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def format_name_artist
    return "#{@name.capitalize}"
  end

  def self.map_items(artist_data)
    return artist_data.map{|artist| Artist.new(artist)}
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artist_data = SqlRunner.run(sql)
    artists = map_items(artist_data)
    return artists
  end

end
