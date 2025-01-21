class Bottle < ApplicationRecord
  # TODO: make `started_at` non-null
  validates_presence_of :started_at, :user
  belongs_to :user
  belongs_to :child

  def finish!(at: Time.now)
    update! ended_at: at
  end
end
