# frozen_string_literal: true

class Table
  def self.clean_screen
    system 'clear'
  end

  def self.player_turn(player)
    casino = Casino.casino
    player.take_card
    player.take_card
    loop do
      if player.points < 21
        Table.clean_screen
        Main.statistics(player, casino)
        View.add_card
        input = gets.chomp.upcase
        if input == 'Y'
          player.take_card
          Table.clean_screen
          Main.statistics(player, casino)
        else (input != 'N') && (input != 'Y')
          View.wrong_command
        end
      end
    break if (input == 'N') || (player.points >= 21)
    end
  end

  def self.casino_turn
    player = Player.player
    casino = Casino.casino
    casino.take_card
    casino.take_card
    Table.clean_screen
    Main.statistics(player, casino)
    loop do
      if casino.points < 20
        sleep 0.3
        casino.take_card
        Table.clean_screen
        Main.statistics(player, casino)
      end
    break if casino.points >= 20
    end
  end

  def self.results(who)
    player = Player.player
    casino = Casino.casino
    if who == player
      if player.points == 21
        Table.clean_screen
        Main.statistics(player, casino)
        View.blackjack
      else player.points > 21
        sleep 0.3
        Table.clean_screen
        Main.statistics(player, casino)
        View.fire
      end
    else who == casino
      if casino.points == 21
        Table.clean_screen
        Main.statistics(player, casino)
        View.blackjack
      elsif casino.points > 21
        Table.clean_screen
        Main.statistics(player, casino)
        View.fire
      else
        Table.clean_screen
        Main.statistics(player, casino)
      end
    end
  end

  def self.final
    player = Player.player
    casino = Casino.casino
    if casino.walet <= 0
      View.win
      View.return_menu
      sleep
      Table.clean_screen
    elsif player.walet <= 0
      View.lose
      View.return_menu
      Table.clean_screen
      Menu.main_menu
    else
      View.next_game
      command = gets.chomp.upcase
      if command != 'N' && command != 'Y'
        View.wrong_command
      elsif command == 'N'
        View.return_menu
        Table.clean_screen
        Menu.main_menu
      else
        Table.clean_screen
        Table.game
      end
    end
  end

  def self.game
    player = Player.player
    casino = Casino.casino
    Main.clean(player, casino)
    Main.games_count
    Main.statistics(player, casino)
    Table.bet(player, casino)
    Table.player_turn(player)
    Table.results(player)
    Table.clean_screen
    Main.statistics(player, casino)
    Table.casino_turn
    Table.results(casino)
    Main.final(player, casino)
    Table.final
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
      Table.bet(player, casino)
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
