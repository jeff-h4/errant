require 'rails_helper'

RSpec.describe User, type: :model do
  def valid_attributes(new_attributes = {})
    {first_name:  "Tom",
     last_name:   "Smith",
     email:       "tome@smith.com",
     password:     "supersecret"
    }.merge(new_attributes)
  end 
  #Testing everything to do with the model
  #Start with Validations
  describe "Validations" do
    it "has a first name" do
      user = User.new valid_attributes({first_name: nil})
      expect(user).to be_invalid
    end
    it "has a last name" do
      user = User.new valid_attributes({last_name: nil})
      expect(user).to be_invalid
    end
    it "has an email" do
      user = User.new valid_attributes({email: nil})
      expect(user).to be_invalid
    end
    # TODO: Add Password validation later. Don't need for now.
  end
end
