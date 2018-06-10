require 'pry'
require_relative 'song'

class Artist
  attr_accessor :name, :songs

    @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

  def self.find_or_create_by_name(artist_name)
    # @@all.find do |artist|  artist.name == artist_name ? artist : artist = Artist.new(artist_name)
    self.all.detect {|artist| artist.name == artist_name} || Artist.new(artist_name)

      # binding.pry
      # if artist.name == artist_name
      #    artist
      # else
      #   artist = Artist.new(artist_name)
      # end
      # binding.pry
  
  end

end
