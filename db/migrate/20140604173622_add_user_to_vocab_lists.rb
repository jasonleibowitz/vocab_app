class AddUserToVocabLists < ActiveRecord::Migration
  def change
    add_column :vocab_lists, :user_id, :integer
  end
end
