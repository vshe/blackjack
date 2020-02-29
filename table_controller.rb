require_relative "casino"
require_relative "player"
require_relative "menu_controller"

loop do
  puts "Готовим стол, тасуем карты..."
  print "5 "
  sleep 1
  print "4 "
  sleep 1
  print "3 "
  sleep 1
  print "2 "
  sleep 1
  print "1 "
  sleep 1
  Main.clean(@player,@casino)
  Main.games_count
  puts "Сделаейте вашу ставку: "
  bet = gets.chomp.to_i
  @player.bet(bet)
  sleep 0.3
  @casino.bet(bet)
  @player.game
  @casino.game
  Main.final(@player,@casino)
  Main.total(@player,@casino)
  puts "еще раз? Y|N >> "
  command == gets.chomp.to_i
  if command == "Y"
    Main.clean(@player,@casino)
  end
break if (@player.walet <= 0) || (@casino.walet <= 0) || command == "N"
end

if command == "N"
  puts "Выход в главное меню..."
  sleep 0.3
else
  if @player.walet <= 0
    sleep 0.3
    puts "СПАСИБО ЗА ИГРУ, ВАС РАЗУЛИ!"
    puts "Выход в главное меню..."
    sleep 0.3
  end
end