class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :court
  belongs_to :partido
end
