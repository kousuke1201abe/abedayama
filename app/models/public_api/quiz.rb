require 'itunes_search_api'

class PublicAPI::Quiz < ApplicationModel
  attribute :name, :string
  attribute :url_code, :string

  validates :name, presence: true

  def self.all
    ::Quiz.all
  end

  def self.find_by(url_code)
    ::Quiz.find_by(url_code: url_code)
  end

  def self.create!(args)
    new(
      name: args[:name],
      url_code: SecureRandom.uuid,
    ).tap(&:save!)
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

  def fetch_four_songs
    ITunesSearchAPI.search(
      term: name,
      country: 'jp',
      media: 'music',
      lang: 'ja_jp',
      attribute: "artistTerm",
      limit: '200'
    )
  end

  def fetch_a_song
    ITunesSearchAPI.search(
      term: name,
      country: 'jp',
      media: 'music',
      lang: 'ja_jp',
      attribute: "artistTerm",
      limit: '1'
    ).first
  end

  def internal_quiz
    @quiz ||=
      ::Quiz.find_or_initialize_by(
        name: name,
        url_code: url_code,
      ).tap do |quiz|
        song = fetch_a_song
        quiz.name = song["artistName"]
        quiz.image_url = song["artworkUrl100"]

        5.times do
          songs = fetch_four_songs

          correct_song = songs.sample
          songs.delete(correct_song)

          quiz.questions.build(
            content: correct_song["previewUrl"]
          ).tap do |question|
            question.build_correct_answer(
              content: correct_song["trackName"]
            )
            3.times do
              incorrect_song = songs.sample
              songs.delete(incorrect_song)

              question.incorrect_answers.build(
                content: incorrect_song["trackName"]
              )
            end
          end
        end
      end
  end
end
