require 'rails_helper'

describe PrototypesController do
  describe 'prototypes#show' do
    let(:prototype) { create(:prototype) }
    it 'assigns @prototype to the given prototype' do
      get :show, params: {id: prototype.id}
      expect(assigns(:prototype)).to eq prototype
    end
  end
end
