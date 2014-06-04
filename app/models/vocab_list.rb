class VocabList < ActiveRecord::Base
  has_and_belongs_to_many :words
  # has_and_belongs_to_many :users
  # belongs_to :list_owner, class_name: 'User'
  belongs_to :user

end
