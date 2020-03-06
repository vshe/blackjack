#для примера эскиз карты, банка и разделительно линии

class View

  def self.card
    puts " ____"   
    sleep 0.1
    puts "|    |"
    sleep 0.1
    puts "| BJ |"
    sleep 0.1
    puts "|____|"
    puts ""
  end

  def self.bank
    puts  " ____________"
    print "|____BANK____|: "
  end

  def self.line
    puts "-----------------------------------------"
    puts ""
  end

  def self.message
    print "[:: DEALER ::] > : "
    sleep 0.5
  end

  def self.system
    print "[:: SYSTEM ::] > : "
    sleep 0.5
  end

end