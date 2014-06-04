class UsersVocabLists < ActiveRecord::Migration
  def change
    create_table :users_vocab_lists, :id => false do |t|
      t.integer :user_id
      t.integer :vocab_list_id
    end
  end
end
