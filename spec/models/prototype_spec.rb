require 'rails_helper'

RSpec.describe Prototype, type: :model do
  it { is_expected.to validate_numericality_of :height }
  it { is_expected.to validate_numericality_of :weight }
  it { is_expected.to validate_presence_of :model_no }
  it { is_expected.to validate_presence_of :manufacturer_id }
  it { is_expected.to belong_to :manufacturer }
end

