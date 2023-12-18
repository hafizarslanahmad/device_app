class Post < ApplicationRecord
    has_many :comments
    belongs_to :user

    accepts_nested_attributes_for :comments, allow_destroy: true
end
