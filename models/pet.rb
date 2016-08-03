require ('pg')
require_relative('../db/sql_runner')

class Pet

  attr_reader( :id, :shop_id, :name)

  def initialize(options)
    @id = options['id'].to_i
    @shop_id = options['shop_id'].to_i
    @name = options['name']
  end

  def save
    sql = "INSERT INTO pets ( name, shop_id) VALUES ('#{@name}', #{@shop_id}) RETURNING *;"
    pet = SqlRunner.run(sql).first
    @id = pet['id'].to_i
  end

  def shop
    sql = "SELECT * FROM shops WHERE id = '#{@shop_id}';"
    shop = SqlRunner.run(sql)
    return ((shop.map {|shop| Shop.new(shop)}
      ).map {|shop| shop.name})[0]
  end

  def self.all
    sql = "SELECT * FROM pets;"
    pets = SqlRunner.run(sql)
    result = pets.map { |pet| Pet.new(pet)}
    array = result.map {|pet| pet.name}
    array.map { |i| i.to_s }.join(", ")
  end

  def self.by_id(id)
    sql = "SELECT * FROM pets WHERE id = #{id}"
    pet = SqlRunner.run(sql)
    return ((pet.map {|pet| Pet.new(pet)}).map {|pet| pet.name})[0]
  end
  
end