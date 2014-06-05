class Word < ActiveRecord::Base
  has_and_belongs_to_many :vocab_lists

  DICTIONARY_API = 'http://www.dictionaryapi.com/api/v1/references/collegiate/xml/'

  def dictionary_lookup
    result = HTTParty.get(DICTIONARY_API + self.word_name + "?key=" + ENV['DICTIONARY_API_KEY'])
    json = Crack::XML.parse(result)
    if json["entry_list"]["suggestion"] == nil
      begin
        self.part_of_speech = json["entry_list"]["entry"][0]["fl"]
        if json["entry_list"]["entry"][0]["def"]["dt"].is_a? Array
          self.definition = json["entry_list"]["entry"][0]["def"]["dt"][0]
        else
          self.definition = json["entry_list"]["entry"][0]["def"]["dt"]
        end
        self.sub_words
      rescue NoMethodError
        self.part_of_speech = json["entry_list"]["entry"]["fl"]
        if json["entry_list"]["entry"]["def"]["dt"].is_a? Array
          self.definition = json["entry_list"]["entry"]["def"]["dt"][0]
        else
          self.definition = json["entry_list"]["entry"]["def"]["dt"]
        end
        self.sub_words
      end
      self.save!
      return 'successful'
    else
      self.destroy!
      return json["entry_list"]["suggestion"]
    end
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
    self.definition.gsub!("<d_link>", "")
    self.definition.gsub!("</d_link>", "")
    self.definition.gsub!("<fw>", "")
    self.definition.gsub!("</fw>", "")
    return self
  end

  def update_list_count
    self.list_count = self.vocab_lists.length
    self.save!
  end

end
