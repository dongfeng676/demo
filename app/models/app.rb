class App < ActiveRecord::Base
  has_many :sever_app_relation
  has_many　:servers, through: :sever_app_relation
end
