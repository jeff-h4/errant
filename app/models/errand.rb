class Errand < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :runner, class_name: "User" 
  validates :title, presence: true
  validates :item_name, presence: true
  validates :price, presence: true
  # store is optional
  def owner_full_name
    if owner
      owner.full_name
    else
      "Anonymous"
    end
  end
  def runner_full_name
    if owner
      owner.full_name
    else
      "Anonymous"
    end
  end
end
