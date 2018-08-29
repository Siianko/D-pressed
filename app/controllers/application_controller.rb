class ApplicationController < ActionController::Base
    before_action :set_locale 
    include Pundit
    protect_from_forgery
    rescue_from Pundit::NotAuthorizedError, with: :access_denied

    before_action :get_edition

    def get_edition
        if user_signed_in? && current_user.geocoded?
            coords = current_user.coordinates 
        elsif cookies[:location]
            coords = eval(cookies[:location])
        end
        locations = Geocoder.search(coords)
        @edition = check_proximity(locations, "Stockholm County") ? "Stockholm" : "Sweden"
        if params['located'] == 'true'

            cookies[:geocoded] = true
        end
    end

    private 

    def load_categories
        @categories = Category.all
    end

    def access_denied
        redirect_to root_path, notice: 'Access denied'
    end 

    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def check_proximity(locations, county)
        locations.any?{|location| location.state == county}
    end
end
