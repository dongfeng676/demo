class Comment < ActiveRecord::Base
  belongs_to :article, counter_cache: true
  has_many :items
end
