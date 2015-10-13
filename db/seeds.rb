# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

userA = FactoryGirl::create(:user,{first_name: "Jeff",
                             last_name: "H",
                             email: "jeff@codecore.ca",
                             password: "J"})
userB = FactoryGirl::create(:user,{first_name: "Tam",
                             last_name: "K",
                             email: "tam@codecore.ca",
                             password: "T"})
userC = FactoryGirl::create(:user,{first_name: "Mehdi",
                             last_name: "M",
                             email: "mehdi@codecore.ca",
                             password: "M"})
10.times do
  errand = FactoryGirl::build(:errand)
  errand.owner = userA
  errand.aasm_state = ["posted","accepted","completed"].sample
  if errand.aasm_state == "posted"
    errand.runner = nil
  else
    errand.runner = [userB,userC].sample
  end
  errand.save
end
10.times do
  errand = FactoryGirl::build(:errand)
  errand.owner = userB
  if errand.aasm_state == "posted"
    errand.runner = nil
  else
    errand.runner = [userA,userC].sample
  end
  errand.save
end
10.times do
  errand = FactoryGirl::build(:errand)
  errand.owner = userC
  if errand.aasm_state == "posted"
    errand.runner = nil
  else
    errand.runner = [userA,userB].sample
  end
  errand.save
end
