require_relative 'song'

class MP3Importer
  attr_accessor :files, :path

  def initialize(file_dir)
    @path = file_dir
    @files = []
    file_names = Dir.entries(@path).select {|f| !File.directory? f}
    file_names.each  { |file| @files << file }
    import
  end

  def import
    @files.each{ |filename| Song.new_by_filename(filename) }
  end


end
