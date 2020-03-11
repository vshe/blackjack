# frozen_string_literal: true

require_relative '../modules/main'

class Casino < Main
  def initialize(name)
    @name = name
    @walet = 10_000
    @hand = []
    @points = 0
    @wins = 0
  end

  def self.new_dealer
    casino = Casino.new('Dealer')
    @casino = casino
  end

  class << self
    attr_reader :casino
  end

  def bet(bet)
    @walet -= bet
    @@bank += bet
  end
end
