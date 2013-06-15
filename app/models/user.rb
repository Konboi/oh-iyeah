class User < ActiveRecord::Base
  has_many :photos
  has_many :goods
  
end
