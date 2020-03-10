require_relative '../modules/casino'
require_relative '../modules/player'

class Menu_controller
  
  def self.clean_screen
    system 'clear'
  end

  def self.main_menu
    Menu_controller.clean_screen
    View.main_menu
    View.command_bar
    command = gets.chomp
    if command != '1' && command != '0'
      View.wrong_command
      Menu_controller.main_menu
    elsif command == '0'
      View.close_game
      Menu_controller.timer
      Menu_controller.clean_screen
      abort
    else command == '1'
      View.enter_name
      Player.new_player
      Menu_controller.start_game
    end
  end

  def self.start_game
    View.start_game
    command = gets.chomp.upcase
    if command != 'N' && command != 'Y'
      View.wrong_command
      Menu_controller.start_game
    elsif command == 'N'
      View.return_menu
      Menu_controller.timer
      Menu_controller.clean_screen
      Menu_controller.main_menu
    else command == 'Y'
      View.message
      print 'Готовим стол, тасуем карты...'
      Menu_controller.timer
      Menu_controller.clean_screen
      #START GAME
    end
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

end

Casino.new_dealer
Menu_controller.main_menu
Table_controller.game

