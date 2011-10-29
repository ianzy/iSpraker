class Api::UsersController < Api::BaseController

  def collection
    latitude = params[:latitude]
    longitude = params[:longitude]

    lat_lhs_range = latitude.to_f - 0.007
    lat_rhs_range = latitude.to_f + 0.007

    lng_lhs_range = longitude.to_f - 0.007
    lng_rhs_range = longitude.to_f + 0.007

    collection = super
    collection.where(:lat => lat_lhs_range..lat_rhs_range,
                     :lng => lng_lhs_range..lng_rhs_range ).select("uid, screen_name, email, created_at, updated_at, lat, lng, profile_image_url, description, time_zone")

  end

end
