class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :permit_quantity, :lodging_quantity, :permit_start_date, :permit_end_date, :total_cost
end
