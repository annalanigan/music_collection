require('pry-byebug')
require_relative('models/artist')
require_relative('models/album')

Album.delete_all
Artist.delete_all

artist1 = Artist.new( {'name' => 'London Grammar'} )
artist2 = Artist.new( {'name' => 'Shakira'} )

artist1.save
artist2.save


album1 = Album.new ({
  'title' => 'Rooting for you',
  'artist_id' => artist1.id
  })

  album2 = Album.new ({
    'title' => 'El Dorado',
    'artist_id' => artist2.id
    })

album1.save
album2.save

artists = Artist.all
albums = Album.all

albums_by_artist = Album.find('16')

binding.pry
nil
