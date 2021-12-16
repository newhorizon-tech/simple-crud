class Note < ApplicationRecord
  validates :title, length: { minimum: 5, maximum: 14 }
  validates :description, length: { maximum: 100 }
end
