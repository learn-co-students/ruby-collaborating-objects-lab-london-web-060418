require 'pry'
require_relative 'artist.rb'
require_relative 'mp3_importer.rb'

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    song_array = file_name.split(" - ")
    song = Song.new(song_array[1])
    song.artist = Artist.find_or_create_by_name(song_array[0])
    song.artist.add_song(song)
  end

  def artist_name(name)
    if Artist.all.include?(name)
      true
    else
      Artist.new(name)
    end
  end

  # binding.pry

end
