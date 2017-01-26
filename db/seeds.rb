require 'faker'

Manufacturer.delete_all
Robot.delete_all

Manufacturer.create(name: "US Robotics")
Manufacturer.create(name: "Mechanical Men Group")
Manufacturer.create(name: "Cyberdyne Systems")
Manufacturer.create(name: "Barry's Automotons")
Manufacturer.create(name: "The Confederation of Ham Manufacturing Concern")


def gen_model_no
  manu = ['UR', 'MM', 'CS', 'BA', 'HM']
  numbs = (0..9).to_a
  suffix = ''
   6.times do
     suffix += numbs.sample.to_s
   end
  model_no = (manu.sample + suffix)
end

15.times { Robot.create(designation: Faker::StarWars.droid, height: Faker::Number.number(2), weight: Faker::Number.number(2), model_no:(gen_model_no))}
