class Heroku::Stack < ApplicationRecord
  validates :heroku_identifier, presence: true, uniqueness: true
  validates :heroku_name, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  validates :heroku_identifier, format: {
    with: /\A[a-f0-9]{8}-([a-f0-9]{4}-){3}[a-f0-9]{12}\z/,
    message: "must be a valid UUID"
  }
end
