require_relative './artist'

class Song

  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name = "")
    @name = name
    @@all << self
  end

  def self.new_by_filename(filename)
    #'Michael Jackson - Black or White - pop.mp3'
    filename_array = filename.split(/(\s+[\-]+[\s])|[.]/)
    #["Michael Jackson", " - ", "Black or White", " - ", "pop", "mp3"]

    artist_name = filename_array[0]
    song_name = filename_array[2]
    genre = filename_array[4]

    song = Song.new(song_name)
    song.genre = genre
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.artist.add_song(song)
    return song
  end


  def self.all
    return @@all
  end

end
