class Sale < ApplicationRecord
    before_create :populate_uuid

    belongs_to :book

    validates_numericality of :price
    greater_than: 49, message "Price must be at least 50 yen!"

    private
    def poplate_uuid
        self.uuid = SecureRandom.uuid()
    end
end
