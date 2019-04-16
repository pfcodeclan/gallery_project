require_relative('../models/artist')
require_relative('../models/exhibit')


# instantiate a new object of Artist class
artist1 = Artist.new({
  'name' => 'Picasso',
  'category' => 'Cubism'
  })
artist1.save()

# instantiate a new object of Artist class
artist2 = Artist.new({
  'name' => 'Banksy',
  'category' => 'Street'
  })
artist2.save()

# instantiate a new object of Artist class
artist3 = Artist.new({
  'name' => 'Klimpt',
  'category' => 'Expressionism'
  })
artist3.save()

# instantiate a new object of Artist class
artist4 = Artist.new({
  'name' => 'Dali',
  'category' => 'Surrealism'
  })
artist4.save()

# instantiate a new object of Exhibit class
exhibit1 = Exhibit.new({
  'name' => 'Early Picasso',
  'category' => 'Cubism'
  })
exhibit1.save()

# instantiate a new object of Exhibit class
exhibit2 = Exhibit.new({
  'name' => 'Early Banksy',
  'category' => 'Street'
  })
exhibit2.save()

# instantiate a new object of Exhibit class
exhibit3 = Exhibit.new({
  'name' => 'Klimpt in Vienna',
  'category' => 'Expressionism'
  })
exhibit3.save()

# instantiate a new object of Exhibit class
exhibit4 = Exhibit.new({
  'name' => 'Life of Dali',
  'category' => 'Surrealism'
  })
exhibit4.save()
