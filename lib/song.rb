# The Song class will be responsible for creating songs given each filename and sending the artist's name (a string) to the Artist class
require 'pry'
class Song

#  extend Concerns::Findable

  # each songs belongs to relationship
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist= Artist.new(name), genre= Genre.new(name))
    @name = name
    self.artist=(artist)
    self.genre=(genre)
    save
  end

  # assigns an artist to the song (song belongs to artist)
  #invokes Artist#add_song to add itself to the artist's collection of songs
    #(artist has many songs)
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end

  def genre
    @genre
  end

  def self.all # Cladd reader
    @@all
  end

  def self.destroy_all #@@all.clear??
    @@all = []
  end

  def save
    @@all << self
  end

   def self.create(name)
     new_song = Song.new(name)
     new_song.save
     new_song
   end

   def self.find_by_name(name)
     @@all.find{|artist| artist.name == name}
   end

   def self.find_or_create_by_name(name)
     if find_by_name(name)
      find_by_name(name)
    else
      self.create(name)
    end
   end

end
