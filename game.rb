require_relative './player'
require_relative './questions'

class Game

  def initialize
    @players = [
      Player.new('Player 1'),
      Player.new('Player 2')
      ]
    @turn = 0
  end

  def play

    while (not game_over?) do
      player_name = player_turn
      question_new = Questions.new(player_name)
      player_answer = question_new.wait_for_answer

      if question_new.correct_answer(player_answer)
        question_new.right_answer(player_name)
      else
        question_new.wrong_answer(player_name)
        @players.each do |player|
          if player.name != player_name
            player.lost_life
          end
        end
      end
      summary

    end

    if @players[0].score == 0
      puts " "
      puts "Player2 wins with a score of #{@players[1].score}/3"
    else
      puts " "
      puts "Player1 wins with a score of #{@players[0].score}/3"
    end

    puts " "
    puts "----- GAME OVER -----"
    puts " "
    puts "Good bye!"

  end

  def player_turn
    if @turn == 0
      player_name = @players[0].name
      @turn = 1
    else
      player_name = @players[1].name
      @turn = 0
    end
    player_name
  end

  def game_over?
    over = false
    @players.each do |player|
      if player.score == 0
        over = true
      end
    end
    over
  end

  def summary
    puts "P1: #{@players[0].score}/3 vs P2: #{@players[1].score}/3"
    if @players[0].score != 0 && @players[1].score != 0
      puts " "
      puts "----- NEW TURN -----"
    end
  end


end