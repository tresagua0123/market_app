class Sale < ApplicationRecord
    before_create :populate_uuid

    
    def populate_uuid
        self.uuid = SecureRandom.uuid()
    end
end