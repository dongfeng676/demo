class ServeAppRelation < ActiveRecord::Base
  belongs_to :server
  belongs_to :app
end
