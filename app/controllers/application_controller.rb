class ApplicationController < ActionController::Base

    before_action :get_edition

    def get_edition
        if user_signed_in? && current_user.geocoded?
            coords = current_user.coordinates 
        elsif cookies[:location]
            coords = eval(cookies[:location])
        end
        locations = Geocoder.search(coords)
        @edition = check_proximity(locations, "Stockholm County") ? "Stockholm" : "Sweden"
        #@edition = "Sweden"
    end


    private 
    def check_proximity(locations, county)
        locations.any?{|location| location.state == county}
    end
end
