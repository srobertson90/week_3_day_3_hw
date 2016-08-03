require_relative('./models/pet')
require_relative('./models/shop')

require('pry-byebug')

shop1 = Shop.new({
  'name' => 'Furry Friends'
  })
shop1.save()
shop2 = Shop.new({
'name' => 'Fluffier Better Friends'
  })
shop2.save()

pet1 = Pet.new({
'name' => 'Nibbles',
'shop_id' => shop1.id
  })
pet1.save
pet2 = Pet.new({
  'name' => 'Snookums',
  'shop_id' => shop2.id
  })
pet2.save
pet3 = Pet.new({
  'name' => 'Sniffles',
  'shop_id' => shop2.id
  })
pet3.save

binding.pry
nil