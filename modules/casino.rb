require_relative "../modules/main"

class Casino < Main
  
  def initialize(name)
    @name = name 
    @walet = 10000
    @hand = []
    @points = 0
    @wins = 0
  end

  def self.new_dealer
    casino = Casino.new("Dealer")
    @casino = casino
  end

  def self.casino
    @casino
  end

  def bet(bet)
    if bet <= @walet
      @walet -= bet
      View.system
      puts "#{self.name}: ставка #{bet}"
      @@bank += bet
    else
      View.system
      puts "Казино идет вабанк"
      self.bet(@walet)
    end
  end

  def game(player,casino)
    self.take_card
    self.take_card
    Menu_controller.clean_screen
    Main.statistics(player,casino)
    loop do
      if @points < 20
        sleep 0.3
        self.take_card
        Menu_controller.clean_screen
        Main.statistics(player,casino)
      end
    break if @points >= 20
    end
    if @points == 21
      Menu_controller.clean_screen
      Main.statistics(player,casino)
      View.message
      puts "BLACKJACK"
    elsif @points > 21
      Menu_controller.clean_screen
      Main.statistics(player,casino)
      View.message
      puts "СГОРЕЛ"
    end
  end
  
end


