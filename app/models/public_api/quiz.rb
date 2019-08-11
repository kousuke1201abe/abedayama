require 'itunes_search_api'

class PublicAPI::Quiz < ApplicationModel
  def self.all
    ::Quiz.all
  end

  def self.fetch_songs_from_itunes_api(artist)
    ITunesSearchAPI.search(
        :term    => artist,
        :country => "jp",
        :media   => 'music',
        :lang    => 'ja_jp',
        :attribute => "artistTerm",
        :limit  => '200'
        )
  end
end
