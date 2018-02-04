class CourtType < ActiveRecord::Base
  enum court_type: [:f5, :f7, :f11]
end