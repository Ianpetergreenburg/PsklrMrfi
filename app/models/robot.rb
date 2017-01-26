class Robot < ApplicationRecord
  
  validates_presence_of :height, :weight, :model_no
  validates_numericality_of :height, :weight

  private

  def gen_model_no
  manu = ['UR', 'MM', 'CS', 'BA', 'HM']
  numbs = (0..9).to_a
  suffix = ''
    6.times do
      suffix += numbs.sample.to_s
    end
  model_no = (manu.sample + suffix)
  end
  
end

