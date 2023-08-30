class Device < ApplicationRecord   
    belongs_to :restaurant

    def ping_update(updated_status)
        update(status: updated_status)
    end
    
end