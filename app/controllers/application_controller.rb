class ApplicationController < ActionController::Base
    include Pundit
    protect_from_forgery
    rescue_from Pundit::NotAuthorizedError, with: :access_denied

    private

    def access_denied
        redirect_to root_path, notice: 'Access denied'
    end
end
