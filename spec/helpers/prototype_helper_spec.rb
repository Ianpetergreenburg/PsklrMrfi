require 'rails_helper'

describe PrototypeHelper, type: :helper do
  describe 'get_attributes_for_robot' do
    it 'retrieves the attributes of a prototype' do
      prototype = create(:prototype)

      attributes = attributes_for(:prototype)
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_s] = v; memo}
      attributes['price'] = attributes['price'] * 2
      attributes['pending'] = true
      attributes['manufacturer_id'] = prototype.manufacturer_id

      expect(get_attributes_for_robot(prototype)).to eq attributes
    end
  end
end
