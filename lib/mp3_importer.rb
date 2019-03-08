# The MP3 Importer will parse all the filenames in the db/mp3s folder and send the filenames to the Song class
class MP3Importer

  attr_accessor :path, :artist, :song

  def initialize(path)
    @path = path
  end

  # loads all the mp3 files in the path directory
  # normalizes the filename to just the mp3 filename with no path
  def files
    files = Dir["#{path}/*.mp3"].each {|file_name| next if File.directory? file_name}
    files.each {|filename| filename.gsub!(/\A(.....................)/, "")}
    files
  end

  def path
    @path
  end

  # imports the files into the library by creating songs from a filename
  def import
    self.files.each{ |filename| Song.new_by_filename(filename) }
  end

end