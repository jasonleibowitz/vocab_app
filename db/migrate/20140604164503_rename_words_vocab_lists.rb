class RenameWordsVocabLists < ActiveRecord::Migration
  def change
    rename_table :words_vocab_lists, :vocab_lists_words
  end
end
