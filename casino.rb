require_relative "main"
class Casino < Main
  def initialize(name)
    @walet = 1000
    @hand = []
    @points = 0
    @wins = 0
  end
  def game
    self.take_card
    self.take_card
    self.show_hand
    loop do
      if @points < 20
        self.take_card
        self.show_hand
      end
    break if @points >= 20
    end
    if @points == 21
      sleep 0.3
      puts "BLACKJACK"
    elsif @points > 21
      sleep 0.3
      puts "СГОРЕЛ"
    end
  end
end

