require ('pg')
require_relative('../db/sql_runner')

class Shop

  attr_reader( :id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO shops ( name ) VALUES ('#{@name}') RETURNING *;"
    shop = SqlRunner.run(sql).first
    @id = shop['id'].to_i
  end

  def pets
    sql = "SELECT * FROM pets WHERE shop_id = '#{@id}';"
    search_result = SqlRunner.run(sql)
    result = search_result.map { |pet| Pet.new(pet)}
    array = result.map {|pet| pet.name}
    array.map { |i| i.to_s }.join(", ")
  end

  def rename(name)
sql = "UPDATE shops SET name = '#{name}' WHERE id = '#{@id}';"
new_shop = SqlRunner.run(sql)
array = new_shop.map {|shop| shop.name}
# array.map { |i| i.to_s }

  end

  def self.all
    sql = "SELECT * FROM shops;"
    shops = SqlRunner.run(sql)
    result = shops.map { |shop| Shop.new(shop)}
    array = result.map {|shop| shop.name}
    array.map { |i| i.to_s }.join(", ")
  end

  def self.by_id(id)
    sql = "SELECT * FROM shops WHERE id = #{id}"
    shop = SqlRunner.run(sql)
    return ((shop.map {|shop| Shop.new(shop)}).map {|shop| shop.name})[0]
  end

end