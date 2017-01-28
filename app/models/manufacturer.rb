class Manufacturer < ActiveRecord::Base
  has_many :prototypes
  has_many :robots


  def self.names
    manufacturers_names
  end

  def inventory_robots
    robots.where(pending: false)
  end


  validates :name, presence: true#,
    # inclusion: { in: name, message: "%{value} is not someone with whom we do business!" }


private

  def manufacturers_names
    manufacturers = HTTParty.get("http://jordankamin.com/robots_api/robots.json")
    name_array = []
    manufacturers.parsed_response["manufacturers"].each do |man|
      name_array << man["name"]
    end
    name_array
  end


end
