require_relative('../models/artist')
require_relative('../models/exhibit')


exhibit1 = Exhibit.new({'name' => 'exhibit1'})
exhibit2 = Exhibit.new({'name' => 'exhibit2'})
exhibit3 = Exhibit.new({'name' => 'exhibit3'})

exhibit1.save
exhibit2.save
exhibit3.save


a1 = Artist.new({
  'name' => 'Picasso',
  'exhibit_id' => exhibit1.id,
  'price' => '10' })
a2 = Artist.new({
  'name' => 'Warhol',
  'exhibit_id' => exhibit2.id,
  'price' => '10' })
a3 = Artist.new({
  'name' => 'Klimpt',
  'exhibit_id' => exhibit3.id,
  'price' => '10' })
a4 = Artist.new({
  'name' => 'Banksy',
  'exhibit_id' => exhibit2.id,
  'price' => '10' })

a1.save
a2.save
a3.save
a4.save
