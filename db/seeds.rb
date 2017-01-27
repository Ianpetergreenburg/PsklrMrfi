require 'faker'
#require 'HTTParty'

#  Manufacturer.delete_all
# # Robot.delete_all
#  Prototype.delete_all


# def prototype_params
#   @manufacturers = HTTParty.get("http://jordankamin.com/robots_api/robots.json")

#   @manufacturers.parsed_response["manufacturers"].each do |man|
#      man["models"].each do |model|
#       p model
#      end
#   end
# end



# @manufacturers = HTTParty.get("http://jordankamin.com/robots_api/robots.json")

#  @manufacturers.parsed_response["manufacturers"].each do |man|
#     manufacturer = Manufacturer.new( {name: man["name"]} )
#     manufacturer.save
#     prototype = Prototype.new(prototype_params)
# end



# # Manufacturer.create(name: "Mechanical Men Group")
# # Manufacturer.create(name: "Cyberdyne Systems")
# # Manufacturer.create(name: "Barry's Automotons")
# # Manufacturer.create(name: "The Confederation of Ham Manufacturing Concern")

def gen_model_no
  manu = ['UR', 'MM', 'CS', 'BA', 'HM']
  numbs = (0..9).to_a
  suffix = ''
    6.times do
      suffix += numbs.sample.to_s
    end
  model_no = (manu.sample + suffix)
end

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
  manufacturers = Manufacturer.names
  index = manufacturers.index(manufacturer)
  initials = abbreviations[index]
  numbs = (0..9).to_a
  suffix = ''
  6.times do
    suffix += numbs.sample.to_s
  end
  initials + suffix
end

User.create(username: 'the_commish', password: 'mutantkiller')

rand(8..15).times { Robot.create(designation: Faker::StarWars.droid, height: Faker::Number.number(2), weight: Faker::Number.number(2), model_no:(gen_model_no))}
rand(8..15).times { Robot.create(height: Faker::Number.number(2), weight: Faker::Number.number(2), model_no:(gen_model_no), pending: true)}

Manufacturer.names.each { |name| Manufacturer.find_or_create_by(name: name) }

20.times do
  prototype = Prototype.new(manufacturer_id: Manufacturer.ids.sample, height: rand(5..50), weight: rand(2..7) )
  prototype.model_no = gen_proto_model_no(prototype.manufacturer.name)
  prototype.save
end
