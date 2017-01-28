module PrototypeHelper
  def get_attributes_for_robot(prototype)
    attributes = {}
    attributes['height'] = prototype.height
    attributes['weight'] = prototype.weight
    attributes['model_no'] = prototype.model_no
    attributes['manufacturer_id'] = prototype.manufacturer_id
    attributes['pending'] = true
    attributes
  end
end
