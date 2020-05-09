require 'pry'

class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  board = []

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    board = @board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
 puts "-----------"
 puts " #{board[3]} | #{board[4]} | #{board[5]} "
 puts "-----------"
 puts " #{board[6]} | #{board[7]} | #{board[8]} "
 end

 def input_to_index(user_input)
   user_input.to_i - 1
 end

 def move(index, current_player)
   board = @board
   board[index] = current_player

 end

 def position_taken?(index)
    @board[index] != " "

    #  binding.pry
 end

 def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
 end



 def turn_count
   i = 0
  @board.each do |j|
    if j == "X" || j == "O"
      i += 1
    end
  end
  i
 end
 #
 # Define your WIN_COMBINATIONS constant
 # WIN_COMBINATIONS = [
 #   [0,1,2],
 #   [3,4,5],
 #   [6,7,8],
 #   [0,3,6],
 #   [1,4,7],
 #   [2,5,8],
 #   [0,4,8],
 #   [2,4,6]
 # ]

 def current_player
   board = @board
   num = turn_count

   if num.even?
      "X"
   elsif num.odd?
      "O"
   end
   x = 0
   o = 0
   board.each do |count|
     if count == "X"
       x += 1
     elsif count == "O"
       o += 1
     end
   end
     if x.even? && o.odd?
       current_player = "O"
     elsif x.odd? && o.even?
       current_player = "X"
     else
       current_player = "X"
     end
      current_player
   # num = turn_count(board)
   # if num.even?
   #    "X"
   # elsif num.odd?
   #    "O"
   # end
 end

 # def turn
 #
 #    if won?
 #      true
 #   elsif over?
 #     true
 #   end
 #   puts "Please enter 1-9:"
 #   input = gets.strip
 #   index = input_to_index(input)
 #   if valid_move?(index)
 #     cp = current_player
 #     move(index, cp)
 #     display_board
 #   end
 #   if over?
 # elsif won?
 #     puts "Congratulations #{current_player}!"
 #   else
 #     turn
 #   end
 # end

 def turn
    puts "What is your move? Enter a number from 1 to 9."
    index = gets
    index = input_to_index(index)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

 def won?
   array_two = []
   board = @board
 #   if board == display_board
 #   end
 #

   i = 0
   WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = board[win_index_1]
       position_2 = board[win_index_2]
       position_3 = board[win_index_3]

       i += 1
       if position_1 == ("X") && position_2 == ("X") && position_3 == ("X")


         array_two << win_combination[0]
         array_two << win_combination[1]
         array_two << win_combination[2]
         array_two.join(",")



        elsif position_1 == ("O") && position_2 == ("O") && position_3 == ("O")


          array_two << win_combination[0]
          array_two << win_combination[1]
          array_two << win_combination[2]
          array_two.join(",")



   end
 end

 if i == 8
    false
 end
array_two == [] ? false : array_two
# array_two
# binding.pry

 end
 # def won?
 #     i = 0
 #     x_array = []
 #     o_array = []
 #     @board.each do |check|
 #       if check == "X"
 #          x_array << i
 #        elsif check == "O"
 #          o_array << i
 #        end
 #          i += 1
 #      end
 #
 #      x_array.join(",")
 #      o_array.join(",")
 #      combo = []
 #       WIN_COMBINATIONS.each do |check|
 #         if x_array.include?(check)
 #           combo << check
 #         elsif o_array.include?(check)
 #           combo << check
 #         end
 #       end
 #       combo.join(",")
 #       false if combo == []
 #   end

 #
 def full?
 #   @board.each do |index|
 #    index == " " ? false : true
 #   end
 # end
   @board.each do |index|
     if index == "X"
       true
     elsif index == "O"
       true
     elsif index == " "
       return false
   end
    true
 end
 end

 #
 #
 #
 #
 #
 def draw?
   board = @board

     if won?
        return false
     elsif full?
           true
   end
     board.each do |index|
       if index == " "
          return false
       end
     end


   end

 def over?
   board = @board
   if won? || draw? || full?
     return true
   end
      false
   end

 def winner
   board = @board

   WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = board[win_index_1]
       position_2 = board[win_index_2]
       position_3 = board[win_index_3]

       if position_1 == ("X") && position_2 == ("X") && position_3 == ("X")
          return "X"
        elsif position_1 == ("O") && position_2 == ("O") && position_3 == ("O")
           return "O"
     end
   end
   if draw? == true || full? == false
      return nil
   end


 end

 def play
 i = 0
   if won?
     puts "Congratulations #{winner(board)}!"
     return
   end
   if draw?
     puts "Cat's Game!"
     return
   end

   turn

   while i < 8
     if won?
       winner
       puts "Congratulations #{winner(board)}!"
       return
     elsif draw?
       puts "Cat's Game!"
       return
     end
      i += 1
      turn
    end
 #   if won?
 #     puts "Congratulations #{current_player}!"
 #
 #   elsif draw?
 #     puts "Cat's Game!"
 #
 #   end
 # end
 end


  #  if over?
  #
  #
  #  elsif won?
  #
  #    puts "Congratulations #{current_player}!"
  #  elsif draw?
  #    puts "Cat's Game!"
  #  else
  #    play
  # end
