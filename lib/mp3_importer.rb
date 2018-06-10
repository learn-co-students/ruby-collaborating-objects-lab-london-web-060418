require 'pry'

class MP3Importer

  attr_accessor :path, :files

  def initialize(file_directory)
    @path = file_directory
    @files = []
    file_names = Dir.entries(@path).select {|f| !File.directory? f}
    file_names.each  { |file| @files << file }
    import
  end

  def import
    @files.each do |file|
      Song.new_by_filename(file)
    end
  end

end
