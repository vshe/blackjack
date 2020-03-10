require_relative '../modules/casino'
require_relative '../modules/player'

class Table_controller
  def self.clean_screen
    system 'clear'
  end

  def self.timer
    print '5 '
    sleep 0.3
    print '4 '
    sleep 0.3
    print '3 '
    sleep 0.3
    print '2 '
    sleep 0.3
    print '1 '
    sleep 0.3
    puts ''
  end

  def self.game
    player = Player.player
    casino = Casino.casino
    Main.clean(player, casino)
    Main.games_count
    Main.statistics(player, casino)
    Table_controller.bet(player, casino)
    player.take_card
    player.take_card
    loop do
      if player.points < 21
        Table_controller.clean_screen
        Main.statistics(player, casino)
        View.add_card        
        input = gets.chomp.upcase
        if input == 'Y'
          player.take_card
          Table_controller.clean_screen
          Main.statistics(player, casino)
        elsif (input != 'N') && (input != 'Y')
          View.wrong_command
        end
      end
    break if (input == 'N') || (player.points >= 21)
    end
    if player.points == 21
      Table_controller.clean_screen
      Main.statistics(player, casino)
      View.blackjack
    else player.points > 21
      sleep 0.3
      Table_controller.clean_screen
      Main.statistics(player, casino)
      View.fire
    end
    Table_controller.clean_screen
    Main.statistics(player, casino)
    casino.take_card
    casino.take_card
    Table_controller.clean_screen
    Main.statistics(player, casino)
    loop do
      if casino.points < 20
        sleep 0.3
        casino.take_card
        Table_controller.clean_screen
        Main.statistics(player, casino)
      end
    break if casino.points >= 20
    end
    if casino.points == 21
      Table_controller.clean_screen
      Main.statistics(player, casino)
      View.blackjack
    elsif casino.points > 21 
      Table_controller.clean_screen
      Main.statistics(player, casino)
      View.fire
    else
      Table_controller.clean_screen
      Main.statistics(player, casino)
    end
    Main.final(player, casino)
    if casino.walet <= 0
      View.win
      View.return_menu
      Table_controller.timer
      sleep
      Table_controller.clean_screen
    elsif player.walet <= 0
      View.lose
      View.return_menu
      Table_controller.timer
      Table_controller.clean_screen
      Menu_controller.main_menu
    else
      View.next_game
      command = gets.chomp.upcase
      if command != 'N' && command != 'Y'
        View.wrong_command
        Table_controller.timer
      elsif command == 'N'
        View.return_menu
        Table_controller.timer
        Table_controller.clean_screen
        Menu_controller.main_menu
      else
        Table_controller.clean_screen
        Table_controller.game
      end
    end
  end

  def self.bet(player, casino)
    $retry_count = 1
    begin
      View.bet
      bet = Integer(gets.chomp)
    rescue ArgumentError => e
      warn e
      $retry_count += 1
      retry if $retry_count <= 999
      warn 'Идиот....'
      exit 1
    end
    if bet > player.walet
      View.no_money
      Table_controller.bet(player, casino)
    else
      View.player_bet(bet)
      player.bet(bet)
      if bet <= casino.walet
        View.casino_bet(bet)
        casino.bet(bet)
      else
        View.casino_allin
        casino.bet(casino.walet)
      end
    end
  end

end