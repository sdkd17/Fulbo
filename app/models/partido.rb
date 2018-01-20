class Partido < ApplicationRecord
  NUMBER_OF_MAX_PLAYERS_SUBSCRIBED = 10
  belongs_to :user
  has_many :anotados
  has_many :aceptados, -> {where(aceptado: true)}, :class_name => 'Anotado' #, before_add: :validates_players_limit

  
  private

  def validates_players_limit(aceptados)
  	raise Exception.new if aceptados.size >= NUMBER_OF_MAX_PLAYERS_SUBSCRIBED
  end
end
