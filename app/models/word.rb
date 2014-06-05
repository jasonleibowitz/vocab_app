class Word < ActiveRecord::Base
  has_and_belongs_to_many :vocab_lists

  DICTIONARY_API = 'http://www.dictionaryapi.com/api/v1/references/collegiate/xml/'

  def dictionary_lookup
    result = HTTParty.get(DICTIONARY_API + self.word_name + "?key=" + ENV['DICTIONARY_API_KEY'])
    json = Crack::XML.parse(result)
    begin
      self.part_of_speech = json["entry_list"]["entry"][0]["fl"]
      self.definition = json["entry_list"]["entry"][0]["def"]["dt"][0]
      self.sub_words
    rescue NoMethodError
      self.part_of_speech = json["entry_list"]["entry"]["fl"]
      self.definition = json["entry_list"]["entry"]["def"]["dt"][0]
      self.sub_words
    end
    self.save!
  end

  def sub_words
    self.definition.gsub!(":", "")
    self.definition.gsub!("<vi>", "")
    self.definition.gsub!("</vi>", "")
    self.definition.gsub!("<it>", "")
    self.definition.gsub!("</it>", "")
    self.definition.gsub!("<aq>", "")
    self.definition.gsub!("</aq>", "")
    self.definition.gsub!("<sx>", ", ")
    self.definition.gsub!("</sx>", ". ")
    return self
  end

  def update_list_count
    self.list_count = self.vocab_lists.length
    self.save!
  end

end
