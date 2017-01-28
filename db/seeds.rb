require 'faker'
require 'HTTParty'

def get_attributes_for_robot(prototype)
  attributes = {}
  attributes['height'] = prototype.height
  attributes['weight'] = prototype.weight
  attributes['model_no'] = prototype.model_no
  attributes['manufacturer_id'] = prototype.manufacturer_id
  attributes['pending'] = [true, false].sample
  attributes
end


Manufacturer.delete_all
Prototype.delete_all
Robot.delete_all

User.create(username: 'the_commish', password: 'mutantkiller')

@manufacturers = HTTParty.get("http://jordankamin.com/robots_api/robots.json")

@manufacturers.parsed_response["manufacturers"].each do |man|
  manufacturer = Manufacturer.create!( {name: man["name"]} )
  man["models"].each do |model|
    Prototype.create!({
      model_no: model["modelNo"],
      height: model["height"],
      weight: model["weight"],
      price: model["price"][1..-1],
      manufacturer: manufacturer
    })
  end
end

protos = Prototype.ids
30.times {
  proto = Prototype.find(protos.sample)
  attributes = get_attributes_for_robot(proto)
  robot = Robot.new(attributes)
  robot.designation = Faker::StarWars.droid unless robot.pending
  robot.save
}
