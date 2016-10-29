require 'sinatra/base'
require 'pry-byebug'

require_relative 'config/config'
require_relative 'vlc'

class Omniplay < Sinatra::Base

  def self.run!
    $vlc = Vlc.new
    $vlc.start
    super
  end

  get '/' do
    haml :index
    $vlc.playlist
  end

  post '/upload' do
    unless params[:file] &&
        (tmpfile = params[:file][:tempfile]) &&
        (name = params[:file][:filename])
      redirect '/'
    end

    puts "Uploading file, original name #{name.inspect}"

    File.open('tmp/temp.mp3', 'w') do |file|
      while bytes = tmpfile.read(65536)
        file.puts bytes
      end
    end

    $vlc.add_to_playlist('tmp/temp.mp3')
    $vlc.play

    redirect '/'
  end

end
