require_relative '../interface/view'

class Main
  attr_reader :wins, :walet, :name
  attr_accessor :hand, :points

  @@bank = 0
  @@games = 0
  @@stack = { '2_ЧЕРВИ' => 2, '3_ЧЕРВИ' => 3, '4_ЧЕРВИ' => 4, '5_ЧЕРВИ' => 5, '6_ЧЕРВИ' => 6, '7_ЧЕРВИ' => 7, '8_ЧЕРВИ' => 8, '9_ЧЕРВИ' => 9, '10_ЧЕРВИ' => 10, 'V_ЧЕРВИ' => 2, 'Q_ЧЕРВИ' => 3, 'K_ЧЕРВИ' => 4, 'A_ЧЕРВИ' => 11,
              '2_БУБНЫ' => 2, '3_БУБНЫ' => 3, '4_БУБНЫ' => 4, '5_БУБНЫ' => 5, '6_БУБНЫ' => 6, '7_БУБНЫ' => 7, '8_БУБНЫ' => 8, '9_БУБНЫ' => 9, '10_БУБНЫ' => 10, 'V_БУБНЫ' => 2, 'Q_БУБНЫ' => 3, 'K_БУБНЫ' => 4, 'A_БУБНЫ' => 11,
              '2_ПИКИ' => 2, '3_ПИКИ' => 3, '4_ПИКИ' => 4, '5_ПИКИ' => 5, '6_ПИКИ' => 6, '7_ПИКИ' => 7, '8_ПИКИ' => 8, '9_ПИКИ' => 9, '10_ПИКИ' => 10, 'V_ПИКИ' => 2, 'Q_ПИКИ' => 3, 'K_ПИКИ' => 4, 'A_ПИКИ' => 11,
              '2_КРЕСТЫ' => 2, '3_КРЕСТЫ' => 3, '4_КРЕСТЫ' => 4, '5_КРЕСТЫ' => 5, '6_КРЕСТЫ' => 6, '7_КРЕСТЫ' => 7, '8_КРЕСТЫ' => 8, '9_КРЕСТЫ' => 9, '10_КРЕСТЫ' => 10, 'V_КРЕСТЫ' => 2, 'Q_КРЕСТЫ' => 3, 'K_КРЕСТЫ' => 4, 'A_КРЕСТЫ' => 11 }

  def self.games_count
    @@games += 1
    puts "Игра номер #{@@games}"
    View.line
  end

  def add_money
    $retry_count = 1
    begin
      View.system
      print 'Внести сумму на счет: '
      money = Integer(gets.chomp)
    rescue ArgumentError => e
      warn e
      $retry_count += 1
      retry if $retry_count <= 999
      warn 'Идиот....'
      exit 1
    end
    @walet += money
    View.system
    puts "Ваш баланс #{@walet} $"
  end

  def win
    @wins += 1
    @walet += @@bank
    @@bank = 0
    View.message
    puts "победа #{name}"
  end

  def self.statistics(player, casino)
    puts "#{player.name}|| деньги: #{player.walet} $ || победы: #{player.wins}"
    puts "#{casino.name}|| деньги: #{casino.walet} $ || победы: #{casino.wins}"
    View.bank
    puts "#{@@bank} $"
    View.line
    print "Вы(очки: #{player.points}): "
    player.show_hand
    print "Дилер(очки: #{casino.points}): "
    casino.show_hand
    View.line
  end

  def show_hand
    y = 0
    @hand.each do |x|
      print x.keys
    end
    puts ''
  end

  def take_card
    View.system
    puts "#{name} берет карту..."
    View.card
    y = @@stack.slice(*@@stack.keys.sample(1))
    @@stack.delete(y.keys[0])
    hand << y
    @points += y.values[0]
  end

  def self.final(player, casino)
    if casino.points == 21 || ((player.points < 21) && (casino.points < 21) && (player.points < casino.points)) || player.points > 21
      sleep 0.3
      casino.win
    else
      sleep 0.3
      player.win
    end
  end

  def self.clean(player, casino)
    @@bank = 0
    player.hand = []
    casino.hand = []
    player.points = 0
    casino.points = 0
    @@stack = { '2_ЧЕРВИ' => 2, '3_ЧЕРВИ' => 3, '4_ЧЕРВИ' => 4, '5_ЧЕРВИ' => 5, '6_ЧЕРВИ' => 6, '7_ЧЕРВИ' => 7, '8_ЧЕРВИ' => 8, '9_ЧЕРВИ' => 9, '10_ЧЕРВИ' => 10, 'V_ЧЕРВИ' => 2, 'Q_ЧЕРВИ' => 3, 'K_ЧЕРВИ' => 4, 'A_ЧЕРВИ' => 11,
                '2_БУБНЫ' => 2, '3_БУБНЫ' => 3, '4_БУБНЫ' => 4, '5_БУБНЫ' => 5, '6_БУБНЫ' => 6, '7_БУБНЫ' => 7, '8_БУБНЫ' => 8, '9_БУБНЫ' => 9, '10_БУБНЫ' => 10, 'V_БУБНЫ' => 2, 'Q_БУБНЫ' => 3, 'K_БУБНЫ' => 4, 'A_БУБНЫ' => 11,
                '2_ПИКИ' => 2, '3_ПИКИ' => 3, '4_ПИКИ' => 4, '5_ПИКИ' => 5, '6_ПИКИ' => 6, '7_ПИКИ' => 7, '8_ПИКИ' => 8, '9_ПИКИ' => 9, '10_ПИКИ' => 10, 'V_ПИКИ' => 2, 'Q_ПИКИ' => 3, 'K_ПИКИ' => 4, 'A_ПИКИ' => 11,
                '2_КРЕСТЫ' => 2, '3_КРЕСТЫ' => 3, '4_КРЕСТЫ' => 4, '5_КРЕСТЫ' => 5, '6_КРЕСТЫ' => 6, '7_КРЕСТЫ' => 7, '8_КРЕСТЫ' => 8, '9_КРЕСТЫ' => 9, '10_КРЕСТЫ' => 10, 'V_КРЕСТЫ' => 2, 'Q_КРЕСТЫ' => 3, 'K_КРЕСТЫ' => 4, 'A_КРЕСТЫ' => 11 }
  end
end
