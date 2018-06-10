require 'pry'
require_relative 'artist'

class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    # @@all << self
  end

 #  def self.all
 #   @@all
 # end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end


 def self.new_by_filename(filename)
   # # filename = "Michael Jackson - Black or White - pop.mp3"
   # song_array = filename.split(" - ")
   # # ["Michael Jackson", "Black or White", "pop.mp3"]
   # title = song_array[1]
   # name = song_array[0]
   #
   # new_song = Song.new(title)
   # new_song.artist_name = name
   #    binding.pry
   # new_song

   song_data = filename.split(" - ")
    song = self.new(song_data[1])
    song.artist_name = song_data[0]
    song
 end


end
