require_relative('../models/artist')
require_relative('../models/exhibit')


ex1 = Exhibit.new({'name' => 'ex1'})
ex2 = Exhibit.new({'name' => 'ex2'})
ex3 = Exhibit.new({'name' => 'ex3'})

ex1.save
ex2.save
ex3.save


a1 = Artist.new({
  'name' => 'Picasso',
  'exhibit_id' => 'ex1',
  'price' => 10 })
a2 = Artist.new({
  'name' => 'Warhol',
  'exhibit_id' => 'ex2',
  'price' => 10 })
a3 = Artist.new({
  'name' => 'Klimpt',
  'exhibit_id' => 'ex3',
  'price' => 10 })
a4 = Artist.new({
  'name' => 'Banksy',
  'exhibit_id' => 'ex2',
  'price' => 10 })

a1.save
a2.save
a3.save
a4.save
