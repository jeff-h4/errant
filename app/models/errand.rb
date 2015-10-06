class Errand < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :runner, class_name: "User" 
  validates :title, presence: true
  validates :item_name, presence: true
  validates :price, presence: true

  # ---------------------------------------------------
  # State Matchine
  # ---------------------------------------------------
  include AASM
  aasm do
    state :posted, initial: :true
    state :pending
    state :completed
    state :cancelled
    event :accept do
      transitions from: :posted, to: :pending
    end
    event :complete do
      transitions from: :pending, to: :completed
    end
    event :cancel do
      transitions from: [:published, :pending], to: :cancelled
    end
  end 
  # ---------------------------------------------------
  # Functions
  # ---------------------------------------------------
  scope :posted, lambda{where(aasm_state: :posted)}
  scope :pending, lambda{where(aasm_state: :pending)}
  scope :completed, lambda{where(aasm_state: :completed)}
  scope :cancelled, lambda{where(aasm_state: :cancelled)}
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

  #def self.search_by_status(errand_status, id)
  #  # thing = "%#{item}%"  
  #  # where(["title ILIKE ? OR body ILIKE ?", thing, thing])

  #  search_term = "%#{item}%"
  #  # where("title || ' ' || body ILIKE ? ", search_term)
  #  where(["aasm_status ILIKE :term AND owner_id ILIKE :term", {term: search_term}])
  #end
end
