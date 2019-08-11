class PublicAPI::Quiz < ApplicationModel
  def self.all
    ::Quiz.all
  end
end
