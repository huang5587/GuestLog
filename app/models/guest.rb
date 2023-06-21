class Guest < ApplicationRecord
    validates :full_name, presence: true, format: { with: /\A([a-zA-Z]+\s){1,}[a-zA-Z]+\z/, message: "must have at least two words" }
    validates :phone_number, presence: true, numericality: { only_integer: true }, length: { minimum: 10, maximum: 11 }
end
