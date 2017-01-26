# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'



def gen_model_no
  manu = ['UR', 'MM', 'CS', 'BA', 'HM']
  numbs = (0..9).to_a
  suffix = ''
   6.times do
     suffix += numbs.sample.to_s
   end
  model_no = (manu.sample + suffix)
end

4.times { Robot.create(designation: Faker::StarWars.droid, height: Faker::Number.number(2), weight: Faker::Number.number(2), model_no:(gen_model_no))}

