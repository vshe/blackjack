require_relative "../modules/casino"
require_relative "../modules/player"

class Menu_controller

  def self.main_menu
    Menu_controller.clean_screen
    puts "Играть 1"
    puts "Выход из игры 0"
    Main.command_bar
    command = gets.chomp
    if command != "1" && command != "0"
      View.system
      puts "неверная команда, пожалуйста повторите"
      Menu_controller.main_menu
    elsif command == "0"
      View.system
      puts "Завершение игры"
      Menu_controller.timer
      Menu_controller.clean_screen
      abort
    else command == "1"
      Player.new_player
      Menu_controller.start_game
      Menu_controller.game
    end
  end

  def self.start_game
    View.message
    print "Начать игру? Y|N >> "
    command = gets.chomp.upcase
    if command != "N" && command != "Y"
      View.system
      puts "неверная команда, пожалуйста повторите"
      Menu_controller.start_game
    elsif command == "N"
      View.system
      puts "Выход в главное меню, пожалуйста подождите..."
      Menu_controller.timer
      Menu_controller.clean_screen
      Menu_controller.main_menu
    else command == "Y"
      View.message
      print "Готовим стол, тасуем карты..."
      Menu_controller.timer
      Menu_controller.clean_screen
    end
  end

  def self.timer
    print "5 "
      sleep 0.3
      print "4 "
      sleep 0.3
      print "3 "
      sleep 0.3
      print "2 "
      sleep 0.3
      print "1 "
      sleep 0.3
      puts ""
  end

  def self.bet(player, casino)
    $retry_count = 1
    begin
      View.message
      print "Сделаейте вашу ставку: "
      bet = Integer(gets.chomp)
    rescue ArgumentError => e
      $stderr.puts e
      $retry_count += 1
      retry if $retry_count <= 999
      $stderr.puts "Идиот...."
      exit 1
    end
    if bet > player.walet
      View.system
      puts "Недостаточно средств"
      Menu_controller.bet(player,casino)
    else
      player.bet(bet)
      casino.bet(bet)
    end
  end

  def self.clean_screen
    system ("clear")
  end

  def self.game
    player = Player.player
    casino = Casino.casino
    Main.clean(player,casino)
    Main.games_count
    Main.statistics(player,casino)
    Menu_controller.bet(player,casino)
    player.game(player,casino)
    Menu_controller.clean_screen
    Main.statistics(player,casino)
    casino.game(player,casino)
    Main.final(player,casino)
    if casino.walet <= 0
      View.message
      puts "ВЫ ПОБЕДИЛИ!!!"
      View.system
      puts "Выход в главное меню, пожалуйста подождите..."
      Menu_controller.timer
      sleep 
      Menu_controller.clean_screen
    elsif player.walet <= 0
      View.message
      puts "ВЫ ПРОИГРАЛИ!!!"
      View.system
      puts "Выход в главное меню, пожалуйста подождите..."
      Menu_controller.timer
      Menu_controller.clean_screen
    else
      View.message
      print "Еще раз? (Y|N) >> "
      command = gets.chomp.upcase
      if command != "N" && command != "Y"
        View.message
        View.system
        puts "неверная команда, пожалуйста повторите"
        Menu_controller.timer
      elsif command == "N"
        View.system
        puts "Выход в главное меню, пожалуйста подождите..."
        Menu_controller.timer
        Menu_controller.clean_screen
        Menu_controller.main_menu
      else
        Menu_controller.clean_screen
        Menu_controller.game
      end
    end
  end

end

Casino.new_dealer
Menu_controller.main_menu
