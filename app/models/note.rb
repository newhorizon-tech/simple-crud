class Note < ApplicationRecord
  validates :title, length: { minimum: 5, maximum: 25 }
  validates :description, length: { maximum: 100 }
end
