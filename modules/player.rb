require_relative "../modules/main"

class Player < Main

  def initialize(name)
    @name = name 
    @walet = 0
    @hand = []
    @points = 0
    @wins = 0
  end

  def self.new_player
    View.system
    print "Введите ваше имя: "
    name = gets.chomp
    player = Player.new(name)
    player.add_money
    @player = player
  end

  def self.player
    @player
  end

  def bet(money)
    @walet -= money
    View.system
    puts "Ваша ставка: #{money}"
    @@bank += money
  end
  
  def game(player,casino)
    self.take_card
    self.take_card
    loop do
      if @points < 21
        Menu_controller.clean_screen
        Main.statistics(player,casino)
        View.message
        print "еще карту? Y|N >> "
        input = gets.chomp.upcase
        if input == "Y"
          self.take_card
          Menu_controller.clean_screen
          Main.statistics(player,casino)
        elsif (input != "N") && (input != "Y")
          View.system
          puts "неверная команда, пожалуйста повторите"
        end
      end
    break if (input == "N") || (@points >= 21)
    end
    if @points == 21
      Menu_controller.clean_screen
      Main.statistics(player,casino)
      View.message
      puts "BLACKJACK"
    elsif @points > 21
      sleep 0.3
      Menu_controller.clean_screen
      Main.statistics(player,casino)
      View.message
      puts "СГОРЕЛ"
    end
  end

end