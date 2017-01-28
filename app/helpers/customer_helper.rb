module CustomerHelper
  def get_inventory
    Robot.where(pending: false)
  end

  def get_manufacturers
    manufacturers = []
    get_inventory.each do |robot|
      p robot
      manufacturers << robot.manufacturer unless manufacturers.include? manufacturer
    end
    manufacturers
  end
end
