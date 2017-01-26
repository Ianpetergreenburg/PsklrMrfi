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

def gen_proto_model_no(manufacturer)
  abbreviations = ['UR', 'MM', 'CS', 'BA', 'HM']
  manufacturers = ["US Robotics", "Mechanical Men Group", "Cyberdyne Systems", "Barry's Automotons", "The Confederate of Ham Manufacturing Concern"]
  index = manufacturers.index(manufacturer)
  initials = abbreviations[index]
  numbs = (0..9).to_a
  suffix = ''
  6.times do
    suffix += numbs.sample.to_s
  end
  initials + suffix
end

User.create(username: 'admin', password: 'pw')

rand(8..15).times { Robot.create(designation: Faker::StarWars.droid, height: Faker::Number.number(2), weight: Faker::Number.number(2), model_no:(gen_model_no))}
rand(8..15).times { Robot.create(height: Faker::Number.number(2), weight: Faker::Number.number(2), model_no:(gen_model_no), pending: true)}

Manufacturer.names.each { |name| Manufacturer.find_or_create_by(name: name) }

20.times do
  prototype = Prototype.new(manufacturer_id: Manufacturer.ids.sample, height: rand(5..50), weight: rand(2..7) )
  prototype.model_no = gen_proto_model_no(prototype.manufacturer.name)
  prototype.save
end
