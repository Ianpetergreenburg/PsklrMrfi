require 'rails_helper'

RSpec.describe Robot, type: :model do
  it { is_expected.to validate_numericality_of :height }
  it { is_expected.to validate_numericality_of :weight }
  it { is_expected.to validate_presence_of :model_no }
end

