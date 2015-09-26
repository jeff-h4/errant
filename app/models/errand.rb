class Errand < ActiveRecord::Base
  belongs_to :owner, class_name: :user
  belongs_to :runner, class_name: :user
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
