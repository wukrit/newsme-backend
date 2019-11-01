class ApplicationController < ActionController::API

    def secret
        Rails.application.credentials.jwt_secret_key
    end

end
