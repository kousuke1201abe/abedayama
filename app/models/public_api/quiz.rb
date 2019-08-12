require 'itunes_search_api'

class PublicAPI::Quiz < ApplicationModel
  attribute :name, :string

  validates :name, presence: true

  def self.all
    ::Quiz.all
  end

  def self.create!(args)
    song_list = fetch_songs_from_itunes_api(args[:name])
    new(name: song_list.first["artistName"]).tap(&:save!)
  end

  def save!
    validate!
    internal_quiz.save!
  end

  def quiz
    validate!
    internal_quiz
  end

  private

  def self.fetch_songs_from_itunes_api(artist_name)
    ITunesSearchAPI.search(
        :term    => artist_name,
        :country => "jp",
        :media   => 'music',
        :lang    => 'ja_jp',
        :attribute => "artistTerm",
        :limit  => '200'
        )
  end

  def internal_quiz
    @quiz ||=
      ::Quiz.find_or_initialize_by(
        name: name
      )
  end
end
