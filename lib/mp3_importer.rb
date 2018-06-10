#The MP3 Importer will parse all the filenames in the db/mp3s folder
#and send the filenames to the Song class

  # require 'pry'

class MP3Importer
  attr_accessor :filenames, :path, :artist

  def initialize(path)
    @path = path
    @filenames = []
  end

  # def files
  #   @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  # end

  def import
    files.each{|song_name| Song.new_by_filename(song_name)}
  end

  def files
    Dir.entries(path).each do |filename|     # ???
      @filenames << filename
    end
    @filenames.delete_if {|x| x == "." || x == ".."}  # ???
    #loads all the mp3 files in the path directory
    #deletes empty files
  end

  # def import
  #   #@filenames
  #   files.each do |filename|
  #     artist_name = filename.split(" - ")[0]
  #     Artist.find_or_create_by_name(artist_name)
  #     print artist_name + "***"
  #     print Artist.all.size
  #
  #     song_name = filename.split(" - ")[1]
  #     Song.new_by_filename(song_name)
  #
  #     #Artist.add_song(song_name)
  #   end
  # end

end
