class Post < ApplicationRecord

    # Post validations is expected to validate that :title cannot be empty/falsy
    validates :title, presence: true

    # Post validations is expected to validate that :category is either ‹"Fiction"› or ‹"Non-Fiction"›
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    # Post validations is expected to validate that :content is at least 100 characters long
    validates :content, length: { minimum: 100 }
end
