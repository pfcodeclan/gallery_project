require_relative('../database/sql_runner')
require_relative('artist')

class Exhibit
  attr_accessor :name, :category, :id
  attr_reader :name, :category, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @category = options['category']
  end

  def self.all()
    sql = "SELECT * FROM exhibits"
    results = SqlRunner.run(sql)
    return results.map {|exhibit|Exhibit.new(exhibit)}
  end

  def save()
    sql = "INSERT INTO exhibits
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
    @id = results.first()['exhibit_id'].to_i
  end

  def update()
    sql = "UPDATE exhibits
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
    sql = "SELECT * FROM exhibits
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Exhibit.new(results.first)
  end

  def delete()
    sql = "DELETE FROM exhibits WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def format_name_exhibit
    return "#{@name.capitalize}"
  end

  def self.map_items(exhibit_data)
    return exhibit_data.map{|exhibit| Exhibit.new(exhibit)}
  end

  def self.delete_all
    sql = "DELETE FROM exhibits"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM exhibits"
    exhibit_data = SqlRunner.run(sql)
    exhibits = map_items(exhibit_data)
    return exhibits
  end

end
