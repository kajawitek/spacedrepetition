class Subject < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  belongs_to :user
end
