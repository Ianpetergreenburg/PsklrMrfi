class Manufacturer < ActiveRecord::Base
  has_many :prototypes

  MANUFACTURERS = ["US Robotics", "Mechanical Men Group", "Cyberdyne Systems", "Barry's Automotons", "The Confederation of Ham Manufacturing Concern"]

  def self.names
    MANUFACTURERS
  end

  validates :name, presence: true,
    inclusion: { in: MANUFACTURERS, message: "%{value} is not someone with whom we do business!" }
end
