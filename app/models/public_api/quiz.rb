require 'itunes_search_api'

class PublicAPI::Quiz < ApplicationModel
  attribute :name, :string

  validates :name, presence: true

  def self.all
    ::Quiz.all
  end

  def self.create!(args)
    new(name: fetch_artist(args[:name])).tap(&:save!)
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

  def self.fetch_artist(name)
    ITunesSearchAPI.search(
        :term    => name,
        :country => "jp",
        :media   => 'music',
        :lang    => 'ja_jp',
        :attribute => "artistTerm",
        :limit  => '1'
    ).first["artistName"]
  end

  def fetch_songs
    ITunesSearchAPI.search(
        :term    => name,
        :country => "jp",
        :media   => 'music',
        :lang    => 'ja_jp',
        :attribute => "artistTerm",
        :limit  => '200'
    )
  end

  def self.choose_four_songs(correct_song, all_songs)#ダミーの3曲と正解の1曲を持つ配列を返す
    song_list = DUMMY_SONGS_NUM.times.map do
      dummy_song = all_songs.sample
      all_songs.delete(dummy_song)
      dummy_song
    end
    song_list << correct_song
    song_list.shuffle
  end

  def internal_quiz
    @quiz ||=
      ::Quiz.find_or_initialize_by(
        name: name
      ).tap do |quiz|
        all_songs = fetch_songs
        correct_song = all_songs.sample
        quiz.questions.build(
          content: correct_song["previewUrl"]
        ).tap do |question|
          question.build_correct_answer(
            content: correct_song["trackName"]
          )
        end
      end
  end
end
