require 'pry'
class Artist
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def self.find_or_create_by_name(name)
    existing_artist = self.class.all.detect {|item| item.name = name}
    if existing_artist
      existing_artist
    else
      self.create(name)
    end

  end

  def print_songs
    @songs.each {|song| puts song.name}
  end

end
