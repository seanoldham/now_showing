class Item < ActiveRecord::Base
  validates_uniqueness_of :uniqueid
  default_scope { order('name') }
  scope :to_watch, -> { where(status: 0) }
  scope :watched, -> { where(status: 1) }
  scope :watching, -> { where(status: 2) }
end
