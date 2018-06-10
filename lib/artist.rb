#The Artist class will be responsible for either creating the artist
#(if the artist doesn't exist in our program yet)
#or finding the instance of that artist (if the artist does exist).

class Artist

    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
      @name = name
      @songs = []   #all artist's songs
    end

    def self.all
      @@all
    end

    def save
      @@all << self
      #self.class.all << self
    end

    def self.create_by_name(name)
      artist = self.new(name)
      artist.save
      artist
    end

    def self.find_by_name(name)
      self.all.detect {|artist| artist.name == name }
      #Detect returns the first item in the list for which the block returns TRUE
    end

    def self.find_or_create_by_name(name)
      #if it exists, return it|| or create it
      self.find_by_name(name) || self.create_by_name(name)
    end

    def add_song(song)
      song.artist = self
      @songs << song
    end

    #keeps track of all artist's songs
    def songs
      @songs.select do |song|
        song.artist == self
      end
    end

    #calls the above songs method puts out song names:
    def print_songs
      self.songs.each do |song|
        puts song.name
      end
    end

end
