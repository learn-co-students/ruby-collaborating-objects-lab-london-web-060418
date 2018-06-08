class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
  end

  def artist_name=(artist_name)
    @artist = Artist.find_or_create_by_name(artist_name)
    @artist.add_song(self)
  end

  def self.new_by_filename(file_name)
    file_ary = file_name.split(' - ')
    new_song = self.new(file_ary[1])
    new_song.artist_name = file_ary[0]
    new_song
  end
end
