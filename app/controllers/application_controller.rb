class ApplicationController < ActionController::Base

    before_action :get_edition

    def get_edition
        if user_signed_in? && current_user.geocoded? 
            if current_user.distance_to([59.334591, 18.063240]) < 50
                @edition = "Stockholm"    
            else
                @edition = "Sweden"
            end
        end
        @edition = "Sweden"
    end

end
