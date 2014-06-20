class Word < ActiveRecord::Base
  has_and_belongs_to_many :vocab_lists

  WORDNIK_API_PREFIX = 'http://api.wordnik.com:80/v4/word.json/'
  WORDNIK_API_SUFFIX = '/definitions?limit=20&includeRelated=true&sourceDictionaries=wiktionary&useCanonical=true&includeTags=false&api_key='

  def dictionary_lookup
    result = HTTParty.get(WORDNIK_API_PREFIX + self.word_name + WORDNIK_API_SUFFIX + ENV['WORDNIK_API_KEY'])
    if result.first == nil
      return false
    else
      self.part_of_speech = result.first["partOfSpeech"]
      self.definition = result.first["text"]
      return "successful"
    end
  end

  def update_list_count
    self.list_count = self.vocab_lists.length
    self.save!
  end

end
