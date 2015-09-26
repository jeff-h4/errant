class Errand < ActiveRecord::Base
  validates :title, presence: true
  validates :item_name, presence: true
  validates :price, presence: true
  # store is optional
end
