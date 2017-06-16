class Library < ApplicationRecord
  validates :name, presence: true
  belongs_to :ruby_gem, optional: true
end
