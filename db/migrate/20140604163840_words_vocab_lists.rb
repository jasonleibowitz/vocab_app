class WordsVocabLists < ActiveRecord::Migration
  def change
    create_table :words_vocab_lists, :id => false do |t|
      t.integer :word_id
      t.integer :vocab_list_id
    end
  end
end
