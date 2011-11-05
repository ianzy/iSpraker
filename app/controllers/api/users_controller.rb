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

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json do
        render :json => {
          :uid => @user.uid,
          :screen_name => @user.screen_name,
          :email => @user.email,
          :created_at => @user.created_at,
          :updated_at => @user.updated_at,
          :lat => @user.lat,
          :lng => @user.lng,
          :profile_image_url => @user.profile_image_url,
          :description => @user.description,
          :time_zone => @user.time_zone
        }
      end
    end
  end

  def update
    @user = User.find_by_token(params[:token])
    requested_options = params[:user].only('screen_name','description','email','profile_image_url','time_zone').symbolize_keys

     if requested_options.empty?
          render_errors_json(['Bad Request'], 400)
        else
          @user.update_attributes(requested_options)
          respond_to do |format|
            format.json do
              render :json => {:msg=>"Update User Info Success"}
            end
          end

     end

  end



  def location
    @user = User.find_by_token(params[:token])
        requested_options = params[:user].only('lat','lng').symbolize_keys

        if requested_options.empty?
          render_errors_json(['Bad Request'], 400)
        else
          @user.update_attributes(requested_options)
          respond_to do |format|
            format.json do
              render :json => {:msg=>"Update User Info Success"}
            end
          end

        end

  end
end
