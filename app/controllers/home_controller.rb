class HomeController < ApplicationController
    def index
        @restaurants = Restaurant.includes(:devices)

    end
end
