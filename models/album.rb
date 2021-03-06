require('pg')
require_relative('../db/sql_runner')
require_relative('./artist')

class Album

  attr_reader :id, :title, :artist_id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @artist_id = options['artist_id'].to_i
  end


  def save
    sql = "INSERT INTO albums (title, artist_id)
     VALUES($1, $2)
     RETURNING *"
     values = [@title, @artist_id]
     result = SqlRunner.run(sql,values)
     @id = result[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return result.map {|album| Album.new(album)}
  end

  def self.find(search_id)
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [search_id]
    result = SqlRunner.run(sql, values)
    return result.map { |album| Album.new(album) }
  end


  def self.delete_all
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

end
