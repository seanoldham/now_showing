class Item < ActiveRecord::Base
  validates_uniqueness_of :uniqueid
  default_scope { order('name') }
end
