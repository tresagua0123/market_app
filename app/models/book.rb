class Book < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    belongs_to :user
    has_many :sales
    has_attached_file :image
    has_attached_file :resource

    validates_attachment :image, presence: true,
    content_type: {content_type: ["image/jpeg", "image/gif", "image/jpg", "image/png" ]},
    message: 'Only images allowed'

    validates_attachment :resource, presence: true,
    content_type: {content_type:  "application/pdf"},
    message: "Only pdf allowed"


end
