class MP3Importer
  attr_accessor :path, :files

  def initialize(file_path)
    @path = file_path
    @files = self.files
  end

  def files
    files_list = Dir[@path + '/*']
    files_list.map do |song_path|
      song_ary = song_path.split('/')
      song_ary.last
    end
  end

  def import
    @files.each do |file_name|
      Song.new_by_filename(file_name)
    end
  end
end
