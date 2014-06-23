require_relative '../spec_helper.rb'

describe Word do
  before :each do
    @word = Word.create(word_name: "happy", part_of_speech: "adjective", definition: "good times, yeah")
    @list = VocabList.create(list_name: 'default', list_owner_id: 1, user_id: 1)
  end

  describe '#update_list_count' do
    it "should update the word's list count by one when it is added to a vocab list" do
      expect(@word.list_count).to eq(0)
      @word.vocab_lists.push(@list)
      @word.update_list_count
      expect(@word.list_count).to eq(1)
    end
  end


end
