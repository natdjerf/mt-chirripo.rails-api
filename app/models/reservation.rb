class Reservation < ActiveRecord::Base
  belongs_to :user
  before_save :calculate_total_cost

  def calculate_total_cost
    days_diff = (permit_end_date - permit_start_date).to_i.abs
    permit_cost = (days_diff + 1) * permit_quantity * 15

    lodging_cost = 0

    if lodging_quantity != 0
     puts lodging_cost = days_diff * lodging_quantity * 35
    end

    self.total_cost = permit_cost + lodging_cost
  end

end
