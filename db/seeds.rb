require 'faker'

Manufacturer.delete_all
Robot.delete_all
Prototype.delete_all

Manufacturer.create(name: "US Robotics")
Manufacturer.create(name: "Mechanical Men Group")
Manufacturer.create(name: "Cyberdyne Systems")
Manufacturer.create(name: "Barry's Automotons")
Manufacturer.create(name: "The Confederation of Ham Manufacturing Concern")


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
