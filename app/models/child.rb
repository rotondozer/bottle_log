class Child < ApplicationRecord
  validates_presence_of :name
  has_many :bottles
end
