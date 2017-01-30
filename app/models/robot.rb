class Robot < ApplicationRecord
  belongs_to :manufacturer

  validates_presence_of :height, :weight, :model_no
  validates_numericality_of :height, :weight, :manufacturer_id
  validates_inclusion_of :pending, in: [true, false]

  def self.inventory
    Robot.where(pending: false)
  end
end
