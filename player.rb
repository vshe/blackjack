require_relative "main"
class Player < Main
  def initialize (name)
    @name = name 
    @walet = 100
    @hand = []
    @points = 0
    @wins = 0
  end
  def game
    self.take_card
    self.take_card
    self.show_hand
    loop do
      if @points < 21
        sleep 0.3
        puts "еще карту? Y|N"
        input = gets.chomp.upcase
        if input == "Y"
          self.take_card
          self.show_hand
        elsif (input != "N") && (input != "Y")
          sleep 0.3
          puts "ewgoiewfhalkfnv"
        end
      end
    break if (input == "N") || (@points >= 21)
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