class CourtType < ActiveRecord::Base
  enum court_type: [:F5, :F7, :F11]
end