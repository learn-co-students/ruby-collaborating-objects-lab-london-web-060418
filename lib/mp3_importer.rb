require 'pry'

class MP3Importer

  attr_reader :path, :arr

  def initialize(path)
    @path = path
  end

  def files
    Dir["#{@path}/*.mp3"].map do |file|
        file = file.sub!("#{@path}/", "")
    end
  end

  def import
    self.files.each{ |file_name| Song.new_by_filename(file_name)}
  end

end
