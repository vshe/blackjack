class View
  def self.command_bar
    print 'Команда >> '
  end
  
  def self.enter_name
    View.system
    print 'Введите ваше имя: '
  end

  def self.player_bet(bet)
    View.message
    puts "Ваша ставка: #{bet}"
  end

  def self.casino_bet(bet)
    View.system
    puts "Ставка казино: #{bet}"
  end

  def self.casino_allin
    View.system
    puts 'Казино идет вабанк'
  end

  def self.add_card
    View.message
    print 'еще карту? Y|N >> '
  end

  def self.blackjack
    View.message
    puts 'BLACKJACK'
  end

  def self.fire
    View.message
    puts 'СГОРЕЛ'
  end

  def self.main_menu
    View.system
    puts 'Играть 1'
    puts 'Выход из игры 0'
  end

  def self.wrong_command
    View.system
    puts 'неверная команда, пожалуйста повторите'
  end

  def self.close_game
    View.system
    puts 'Завершение игры'
  end

  def self.start_game
    View.system
    print 'Начать игру? Y|N >> '
  end
  
  def self.return_menu
    View.system
    puts 'Выход в главное меню, пожалуйста подождите...'
  end

  def self.next_game
    View.message
    print 'Еще раз? (Y|N) >> '
  end

  def self.lose
    View.system
    puts 'ВЫ ПРОИГРАЛИ!!!'
  end

  def self.win
    View.system
    puts 'ВЫ ПОБЕДИЛИ!!!'
  end

  def self.no_money
    View.system
    puts 'Недостаточно средств'
  end

  def self.bet
    View.message
    print 'Сделаейте вашу ставку: '
  end

  def self.card
    puts ' ____'
    sleep 0.1
    puts '|    |'
    sleep 0.1
    puts '| BJ |'
    sleep 0.1
    puts '|____|'
    puts ''
  end

  def self.bank
    puts  ' ____________'
    print '|____BANK____|: '
  end

  def self.line
    puts '-----------------------------------------'
    puts ''
  end

  def self.message
    print '[:: DEALER ::] > : '
    sleep 0.5
  end

  def self.system
    print '[:: SYSTEM ::] > : '
    sleep 0.5
  end
end
