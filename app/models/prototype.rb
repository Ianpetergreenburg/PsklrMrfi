class Prototype < ApplicationRecord
  belongs_to :manufacturer

  validates_presence_of :height, :weight, :model_no, :manufacturer_id, :price
  validates_numericality_of :height, :weight
end
