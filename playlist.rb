class Playlist
  PlaylistItem = Struct.new(:number, :title, :length, :times_played)

  def initialize(playlist_array)
    @playlist_items = playlist_array.map do |playlist_hash|
      PlaylistItem.new(playlist_hash[:number], playlist_hash[:title], playlist_hash[:length], playlist_hash[:times_played])
    end
  end

  def items
    @playlist_items
  end
end
