require 'pry'
require_relative 'artist.rb'
require_relative 'song.rb'

class MP3Importer

  attr_accessor :path

  @@all = []

  def initialize(path)
    @path = path
  end

  def files
    files = []
    Dir.foreach(self.path) do |f|
      files << f
      files.delete_if {|x| x == "." ||x == ".."}
    end
    files
  end

  def import
    files.each do |song|
      Song.new_by_filename(song)
    end
  end

  # binding.pry







end
