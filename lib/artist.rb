require 'pry'
require_relative 'mp3_importer.rb'
require_relative 'song'

class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def self.find_or_create_by_name(artist_name)
    self.all.detect {|artist| artist.name == artist_name} || Artist.new(artist_name)
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
    song.artist = self
    song
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end

  # binding.pry

end
