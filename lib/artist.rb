require_relative './song'

class Artist

  @@all = []
  attr_accessor :name, :songs

  def initialize(artist_name)
    @name = artist_name
    @songs = []
    save
  end

  def self.find_or_create_by_name(artist_name)
    artist = @@all.find {|artist| artist.name == artist_name}
    if(!artist)
      artist = Artist.new(artist_name)
    end
    return artist
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    return @@all
  end

  def print_songs
    @songs.each { |song| puts song.name  }
  end

end
