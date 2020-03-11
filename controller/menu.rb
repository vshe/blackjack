# frozen_string_literal: true

require_relative '../modules/casino'
require_relative '../modules/player'
require_relative 'table'

class Menu
  def self.clean_screen
    system 'clear'
  end

  def self.main_menu
    View.main_menu
    View.command_bar
    command = gets.chomp
    if command != '1' && command != '0'
      View.wrong_command
      Menu.main_menu
    elsif command == '0'
      View.close_game
      Menu.clean_screen
      abort
    else command == '1'
      View.enter_name
      Player.new_player
      Menu.start_game
    end
  end

  def self.start_game
    View.start_game
    command = gets.chomp.upcase
    if command != 'N' && command != 'Y'
      View.wrong_command
      Menu.start_game
    elsif command == 'N'
      View.return_menu
      Menu.clean_screen
      Menu.main_menu
    else command == 'Y'
      View.prepare_table
      Menu.clean_screen
      Table.game
    end
  end
end

Casino.new_dealer
Menu.clean_screen
Menu.main_menu
