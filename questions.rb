class Questions

  def initialize player_name

    @number1 = generate_number
    @number2 = generate_number
    @question = generate_question(player_name)

  end

  def generate_number
    number_for_question = rand(1..20)
  end

  def generate_question(player_name)
    puts "#{player_name}: What does #{@number1} plus #{@number2} equal?"
  end

  def wait_for_answer
    print "> "
    player_answer = $stdin.gets.chomp.to_i
  end

  def correct_answer(player_answer)
    correct_ans = @number1 + @number2
    if player_answer == correct_ans
      true
    else
      false
    end
  end

  def wrong_answer(player_name)
    puts "#{player_name}: Seriously? No!"
  end

  def right_answer(player_name)
    puts "#{player_name}: YES! You are correct."
  end

end