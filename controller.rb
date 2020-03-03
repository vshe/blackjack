require_relative "casino"
require_relative "player"

casino = Casino.new("Dealer")

loop do

  puts "Играть 1"
  puts "Выход из игры 0"
  Main.command_bar
  command = gets.chomp
  puts ""
  sleep 0.3

  loop do
    if command != "1" && command != "0"
      puts "неверная команда, пожалуйста повторите"
      Main.command_bar
      command = gets.chomp
      puts ""
      sleep 0.3
    end
  break if (command == "1") || (command == "0")
  end

break if command == "0"

  if command == "1"

    print "Введите ваше имя: "
    name = gets.chomp

    loop do
      if name == nil
        puts "Нельзя оставлять поле пустым"
        print "Введите ваше имя: "
        name = gets.chomp
      end
    break if name != nil
    end

    player = Player.new(name)
    puts "Ваш баланс #{player.walet} $"

    $retry_count = 1
 
    begin
      print "Внести сумму: "
      count = Integer(gets.chomp)
    rescue ArgumentError => e
      $stderr.puts e
      $retry_count += 1
      retry if $retry_count <= 999
      $stderr.puts "Идиот...."
      exit 1
    end
    
    player.add_money(count)
    casino.add_money(count)
    puts "Ваш баланс #{player.walet} $"
    sleep 0.3

    loop do
      print "Начать игру? Y|N >> "
      command = gets.chomp.upcase
      if command != "N" && command != "Y"
        sleep 0.3
        puts "неверная команда, пожалуйста повторите"
      end
    break if command == "Y" || command == "N"
    end

  end

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
    puts ""
    Main.clean(player,casino)
    Main.games_count

    $retry_count = 1
  
      begin
        print "Сделаейте вашу ставку: "
        bet = Integer(gets.chomp)
      rescue ArgumentError => e
        $stderr.puts e
        $retry_count += 1
        retry if $retry_count <= 999
        $stderr.puts "Идиот...."
        exit 1
      end

    loop do
      if bet > player.walet
        puts "Недостаточно средств"

        $retry_count = 1
  
        begin
          print "Сделаейте вашу ставку: "
          bet = Integer(gets.chomp)
        rescue ArgumentError => e
          $stderr.puts e
          $retry_count += 1
          retry if $retry_count <= 999
          $stderr.puts "Идиот...."
          exit 1
        end
      end
    break if bet <= player.walet
    end

    player.bet(bet)
    sleep 0.3
    casino.bet(bet)

    player.game
    casino.game
    Main.final(player,casino)
    Main.total(player,casino)
    
  break if (player.walet <= 0) || (casino.walet <= 0)

    loop do
      print "еще раз? Y|N >> "
      command = gets.chomp.upcase
        if command != "N" && command != "Y"
          sleep 0.3
          puts "неверная команда, пожалуйста повторите"
        end
    break if command == "Y" || command == "N"
    end

  break if command == "N"
  end

  if command == "N"
    sleep 0.3
  elsif casino.walet <= 0
    sleep 0.3
    puts "ВЫ ПОБЕДИЛИ!!!"
    sleep 0.3
  else player.walet <= 0
    sleep 0.3
    puts "СПАСИБО ЗА ИГРУ, ВЫ ПРОИГРАЛИ!"
    sleep 0.3
  end

  puts "Выход в главное меню..."
  sleep 0.3

end

puts "Завершение игры"
sleep 1



