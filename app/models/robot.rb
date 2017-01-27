class Robot < ApplicationRecord

  validates_presence_of :height, :weight, :model_no
  validates_numericality_of :height, :weight

end
