class ApplicationController < ActionController::Base
    def curren_user
        User.first
    end
end
