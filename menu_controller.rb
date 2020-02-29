require_relative "casino"
require_relative "player"

casino = Casino.new("Dealer")

loop do
  print "Введите ваше имя: "
  name = gets.chomp
  player = Player.new(name)
  puts "Ваш баланс #{player.walet} $"
  print "Внести сумму: "
  count = gets.chomp.to_i
  player.add_money(count)
  print "Начать игру? Y|N >> "
  command = gets.chomp.upcase
break if command == "N"
  loop do
    puts "Готовим стол, тасуем карты..."
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
    Main.clean(player,casino)
    Main.games_count
    print "Сделаейте вашу ставку: "
    bet = gets.chomp.to_i
    player.bet(bet)
    sleep 0.3
    casino.bet(bet)
    player.game
    casino.game
    Main.final(player,casino)
    Main.total(player,casino)
  break if (player.walet <= 0) || (casino.walet <= 0)
    print "еще раз? Y|N >> "
    command = gets.chomp.upcase
    if command == "Y"
      Main.clean(player,casino)
    end
  break if command == "N"
  end

  if command == "N"
    puts "Выход в главное меню..."
    sleep 0.3
  else player.walet <= 0
    sleep 0.3
    puts "СПАСИБО ЗА ИГРУ, ВАС РАЗУЛИ!"
    puts "Выход в главное меню..."
    sleep 0.3
  end

end

puts "Завершение игры"
sleep 1



