class Story < ApplicationRecord
  belongs_to :user

  scope :most_recent, -> { order(updated_at: :desc) }

end
