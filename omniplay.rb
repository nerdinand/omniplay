require 'sinatra/base'
require 'pry-byebug'

require_relative 'config/config'
require_relative 'vlc'

class Omniplay < Sinatra::Base
  helpers do
    def h(text)
      Rack::Utils.escape_html(text)
    end
  end

  def self.run!
    $vlc = Vlc.new
    $vlc.start
    super
  end

  get '/' do
    @playlist = $vlc.playlist
    haml :index
  end

  post '/upload' do
    unless params[:file] &&
        (tmpfile = params[:file][:tempfile]) &&
        (name = params[:file][:filename])
      redirect '/'
    end

    clean_file_name = "#{Time.now.to_i}-#{name.gsub(/[^0-9A-Za-z_\-\.]/, '-')}"
    file_path = "tmp/#{clean_file_name}"

    File.open(file_path, 'w') do |file|
      while bytes = tmpfile.read(65536)
        file.puts bytes
      end
    end

    $vlc.add_to_playlist(file_path)
    $vlc.play

    redirect '/'
  end

end
