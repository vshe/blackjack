# frozen_string_literal: true

require_relative '../modules/main'

class Player < Main
  def initialize(name)
    @name = name
    @walet = 0
    @hand = []
    @points = 0
    @wins = 0
  end

  def self.new_player
    name = gets.chomp
    player = Player.new(name)
    player.add_money
    @player = player
  end

  class << self
    attr_reader :player
  end

  def bet(money)
    @bet = money
    @walet -= money
    @@bank += money
  end
end
