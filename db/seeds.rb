# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

userA = FactoryGirl::create(:user,{first_name: "a",
                             last_name: "a",
                             email: "a@a.com",
                             password: "a"})
userB = FactoryGirl::create(:user,{first_name: "b",
                             last_name: "b",
                             email: "b@b.com",
                             password: "b"})
userC = FactoryGirl::create(:user,{first_name: "c",
                             last_name: "c",
                             email: "c@c.com",
                             password: "c"})
10.times do
  errand = FactoryGirl::build(:errand)
  errand.owner = userA
  errand.runner = userB
  errand.save
end
10.times do
  errand = FactoryGirl::build(:errand)
  errand.owner = userA
  errand.runner = userC
  errand.save
end
10.times do
  errand = FactoryGirl::build(:errand)
  errand.owner = userB
  errand.runner = userA
  errand.save
end
