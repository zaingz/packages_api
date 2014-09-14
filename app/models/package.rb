class Package < ActiveRecord::Base
  belongs_to :user

  ##Validations
  validates_presence_of :tittle, :description, :src_lat, :src_lon,
                        :dest_lat, :dest_lon, :user_id

end
