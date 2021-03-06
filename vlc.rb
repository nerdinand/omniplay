require 'vlc-client'
require_relative 'playlist'

class Vlc
  attr_reader :vlc

  def start
    @vlc = VLC::System.new
    vlc.connected?
  end

  def add_to_playlist(path)
    vlc.add_to_playlist(path)
  end

  def play
    vlc.play
  end

  def playlist
    Playlist.new(vlc.playlist)
  end
end
