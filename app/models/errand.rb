class Errand < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :item_name, presence: true
  validates :price, presence: true
  # store is optional
  def user_name
    if user 
      user.full_name
    else
      "Anonymous"
    end
  end
end
