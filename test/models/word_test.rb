require 'minitest/autorun'

describe Word, "Testing of Word Model" do

  before do
    @word = Word.create(word_name: "happy", part_of_speech: "adjective", definition: "good times, yeah")
    @list = VocabList.create(list_name: 'default', list_owner_id: 5, user_id: 5)
  end

  describe '#update_list_count' do
    it "will update the word's list count by one when it is added it a vocab list" do
      @word.list_count.must_equal 0
      @word.vocab_lists.push(@list)
      @word.update_list_count
      @word.list_count.must_equal 1
    end
  end
end
