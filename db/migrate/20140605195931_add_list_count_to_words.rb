class AddListCountToWords < ActiveRecord::Migration
  def change
    add_column :words, :list_count, :integer, :default => 0
  end
end
