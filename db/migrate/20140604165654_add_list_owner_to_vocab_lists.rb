class AddListOwnerToVocabLists < ActiveRecord::Migration
  def change
    add_column :vocab_lists, :list_owner_id, :integer
  end
end
