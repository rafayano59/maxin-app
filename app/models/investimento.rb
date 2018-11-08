class Investimento < ApplicationRecord
  validates :name, presence: true, length: {minimum: 3, maximum: 25}
  validates :price, presence: true
  validates :nivel, presence: true


end
