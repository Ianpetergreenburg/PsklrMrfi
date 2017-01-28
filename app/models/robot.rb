class Robot < ApplicationRecord
  belongs_to :manufacturer

  validates_presence_of :height, :weight, :model_no
  validates_numericality_of :height, :weight, :manufacturer_id

  def self.inventory
    Robot.where(pending: false)
  end
end
