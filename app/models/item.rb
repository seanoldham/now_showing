class Item < ActiveRecord::Base
  validates_uniqueness_of :uniqueid
end
