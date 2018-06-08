require 'pry'

class Artist
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    self.save
  end

  def add_song(song)
    song.artist = self
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    artist = @@all.find do |artist|
      artist.name == name
    end
    artist = self.new(name) if artist == nil
    artist
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
end
