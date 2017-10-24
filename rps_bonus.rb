VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

WINNING_CONDITIONS = {
  'rock' => ['lizard', 'scissors'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['rock', 'scissors']
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def player_selects
  choice = nil
  loop do
    prompt("Enter a choice:")
    VALID_CHOICES.each do |key, value|
      puts("#{key} = #{value}")
    end
    choice = Kernel.gets().chomp()
    break if VALID_CHOICES.key?(choice)
    puts "That's not a valid choice."
  end
  VALID_CHOICES[choice]
end

def choose_winner(player_choice, computer_choice)
  if WINNING_CONDITIONS[player_choice].include?(computer_choice)
    'player'
  elsif WINNING_CONDITIONS[computer_choice].include?(player_choice)
    'computer'
  else
    'tie'
  end
end

def display_results(winner)
  case winner
  when 'player'
    prompt("YOU WIN")
  when 'computer'
    prompt("COMPUTER WINS")
  else
    prompt("TIE")
  end
end

# PROGRAM EXECUTION BEGINS HERE
prompt("Welcome!  Let's play Rock, Paper, Scissors.")
puts("First one to reach 5 wins is the Grand Winner! \n\n")

loop do # main loop
  player_wins = 0
  computer_wins = 0

  loop do
    player_choice = player_selects()

    computer_choice = VALID_CHOICES.values.sample()

    puts "\n"
    prompt("You chose: #{player_choice} =>" \
    " The computer chose: #{computer_choice}")

    if choose_winner(player_choice, computer_choice) == 'player'
      display_results('player')
      player_wins += 1
    elsif choose_winner(player_choice, computer_choice) == 'computer'
      display_results('computer')
      computer_wins += 1
    else
      display_results('tie')
    end

    if player_wins == 5
      prompt("You are the Grand Winner!")
      break
    end

    if computer_wins == 5
      prompt("Sorry.  The computer is the Grand Winner.")
      break
    end

    prompt("Player has #{player_wins} wins.")
    prompt("Computer has #{computer_wins} wins.")
    puts "-----------------------------------------------\n\n"

  end

  prompt("Enter 'y' if you want to play again.")
  play_again = Kernel.gets().chomp()
  break unless play_again.downcase() == 'y'
end

prompt("Thank you for playing.  Goodbye!")
