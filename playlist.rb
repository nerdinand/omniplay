class Playlist
  PlaylistItem = OpenStruct.new(:number, :title, :length, :times_played)

  def initialize(playlist_array)
    @playlist_items = playlist_array.map do |playlist_hash|
      PlaylistItem.new(playlist_hash)
    end
  end
end
