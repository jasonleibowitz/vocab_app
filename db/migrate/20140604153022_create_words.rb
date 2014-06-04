class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word_name
      t.string :part_of_speech
      t.string :definition
    end
  end
end
