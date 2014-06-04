class CreateVocabList < ActiveRecord::Migration
  def change
    create_table :vocab_lists do |t|
      t.string :list_name
    end
  end
end
