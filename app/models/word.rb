class Word < ActiveRecord::Base
  has_and_belongs_to_many :vocab_lists

  DICTIONARY_API = 'http://www.dictionaryapi.com/api/v1/references/collegiate/xml/'

  def dictionary_lookup
    # binding.pry
    result = HTTParty.get(DICTIONARY_API + self.word_name + "?key=" + ENV['DICTIONARY_API_KEY'])
    json = Crack::XML.parse(result)
    if json["entry_list"]["entry"].length > 1
      self.part_of_speech = json["entry_list"]["entry"][0]["fl"]
      self.definition = json["entry_list"]["entry"][0]["def"]["dt"][0]
    else
      self.part_of_speech = json["entry_list"]["entry"]["fl"]
      self.definition = json["entry_list"]["entry"]["def"]["dt"][0]
    end
    self.save!
  end

end
