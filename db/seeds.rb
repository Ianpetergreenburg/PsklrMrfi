require 'faker'
require 'HTTParty'


Manufacturer.delete_all
Prototype.delete_all

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
