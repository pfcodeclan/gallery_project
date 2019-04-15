require_relative('../database/sql_runner')

class Exhibit

  attr_reader :id, :name
  attr_accessor :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = ['name']
  end

  def save()
    sql = "INSERT INTO exhibits
      (
        name
      )
      VALUES
      (
        $1
      )
      RETURNING id"
      values = [@name]
      result = SqlRunner.run(sql, values)
      @id = result.first['id'].to_i
      # @id = id.to_i
  end

  def self.find(id)
    sql = "SELECT * FROPM exhibits WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    exhibit = Exhibit.new(result)
    return exhibit
  end

  def self.all()
    sql = "SELECT * FROM exhibits"
    exhibit_data = SqlRunner.run(sql)
    exhibits = map_items(exhibit_data)
    return exhibits
  end

  def self.map_items(exhibit_data)
    return exhibit_data.map{|exhibit| Exhibit.new(exhibit)}
  end

end
