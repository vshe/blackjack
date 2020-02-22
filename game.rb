require_relative "casino"
require_relative "player"

c=Casino.new("Dealer")
p1=Player.new("Bob")

loop do
  puts "Подготовка к следующей игре...протираем стол, тасуем карты, неможко мухлюем..."
  print 5
  sleep 1
  print 4
  sleep 1
  print 3
  sleep 1
  print 2
  sleep 1
  print 1
  sleep 1
  Main.clean(p1,c)
  Main.games_count
  p1.bet(10)
  sleep 0.3
  c.bet(10)
  p1.game
  c.game
  Main.final(p1,c)
  Main.total(p1,c)
  Main.clean(p1,c)
break if (p1.walet <= 0) || (c.walet <= 0) 
end
if p1.walet <= 0
  sleep 0.3
  puts "СПАСИБО ЗА ИГРУ, ВАС РАЗУЛИ!"
else c.walet <= 0
  sleep 0.3
  puts "ВЫ ОБЧИСТИЛИ КАЗИНО. ВИДИМО ВЫ ОЧЕНЬ ДОЛГО ИГРАЛИ....НУ ЛАДНО, МОЛОДЕЦ!"
  sleep 0.3
  puts "P.S ЗА ВАМИ УЖЕ ВЫЕХАЛИ"
end


