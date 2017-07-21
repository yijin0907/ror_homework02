class Player
  def initialize(name)
    @name = name
  end  
end

# 人類玩家的類別
class Human < Player  
  def get_gesture
    input = gets.chomp.upcase
  end
end

# 電腦的類別
class Computer < Player
  def get_gesture
  	input = ['R', 'P', 'S'].shuffle!.last
  end
end


class RPS  
  def initialize
    intro
    show_message
  end

  def intro
    #印出開場畫面，告訴玩家遊戲規則
    puts "|===============================================|" 
    puts "|       Welcome to Rock Paper Scissors!!!       |"
    puts "|===============================================|"
    print "Please Type Your Name :"
    @name = gets.chomp.upcase
  end

  def decide
    #邏輯判斷式
    if @user_input == "R" && @com_input == "P" 
      puts "You Fail!"
    elsif @user_input == "R" && @com_input == "S"
      puts "You Win!"
    elsif @user_input == "P" && @com_input == "R"
      puts "You Win!"
    elsif @user_input == "P" && @com_input == "S"
      puts "You Fail!"
    elsif @user_input == "S" && @com_input == "P"
    puts "You Win!"
    elsif @user_input == "S" && @com_input == "R"
      puts "You Fail!"
    else
      puts "End In a Draw!"
    end
  end

  def get_player_gestures
    #取得玩家和電腦兩個物件的
    user = Human.new(@name)
    begin
      puts "Please choose one of the following: R / P / S"
      @user_input = user.get_gesture
    end while !["R", "P", "S"].include?(@user_input)

    computer = Computer.new("Computer")
    @com_input = computer.get_gesture
  end

  def continue
    #判斷玩家是否要繼續下一輪
    begin
      puts "Play Again?: Y / N"
      @continue = gets.chomp.upcase
    end while !["Y", "N"].include?(@continue)
  end

  def show_message    
    begin
      get_player_gestures
      decide
      continue
    end while @continue == 'Y'
    puts "|===============================================|"
    puts "|         Good Bye! Thanks for playing!         |"
    puts "|===============================================|"
  end

end

# ------------Main Program Starts Here ---------------------
# 主程式只要一行即可
game = RPS.new