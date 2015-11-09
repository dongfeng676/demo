class Server < ActiveRecord::Base
  has_many :server_app_relations
  has_many :app, through: :server_app_relations
end
