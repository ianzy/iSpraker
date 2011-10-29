class Api::EventsController < Api::BaseController

    def collection
    latitude = params[:latitude]
    longitude = params[:longitude]

    lat_lhs_range = latitude.to_f - 0.0007
    lat_rhs_range = latitude.to_f + 0.0007

    lng_lhs_range = longitude.to_f - 0.0007
    lng_rhs_range = longitude.to_f + 0.0007

    collection = super
    collection.where(:lat => lat_lhs_range..lat_rhs_range,
                     :lng => lng_lhs_range..lng_rhs_range ).select("name, description, url, lat, lng, address, event_time, created_at, updated_at")

  end
  
end
