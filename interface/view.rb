#для примера эскиз карты, банка и разделительно линии

class View

  def self.card
    sleep 0.3
    puts " ____"   
    puts "|    |"
    puts "| BJ |"
    puts "|____|"
    puts ""
  end

  def self.bank_top
    sleep 0.3
    puts  " ____________"
    puts  "|            |"
    print "|    BANK    |: "
  end

  def self.bank_bottom
    puts  "|____________|"
    puts  ""
  end

  def self.line
    puts "____________________________________"
    puts ""
  end

end