module CustomerHelper
  def get_inventory
    Robot.where(pending: false)
  end

  def get_manufacturers
    manufacturers = []
    get_inventory.each do |robot|
      manufacturers << robot.manufacturer unless manufacturers.include? robot.manufacturer
    end
    manufacturers.sort_by{ |manu| manu.name }
  end
end
