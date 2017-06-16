class RubyGem < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name

  belongs_to :user

  # accepts_nested_attributes_for :libraries, :reject_if => :all_blank, allow_destroy: true
end
