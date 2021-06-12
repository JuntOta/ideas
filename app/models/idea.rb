class Idea < ApplicationRecord

  with_options presence: true do
    validates :body
  end

  belongs_to :category
end
