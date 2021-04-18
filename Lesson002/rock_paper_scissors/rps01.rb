def prompt(message)
  puts "=> #{message}"
end

def choice_decode(selection)
  if selection.downcase.start_with?('r')
    'Rock'
  elsif selection.downcase.start_with?('p')
    'Paper'
  elsif selection.downcase.start_with?('sc')
    'Scissors'
  elsif selection.downcase.start_with?('l')
    'Lizard'
  elsif selection.downcase.start_with?('sp')
    'Spock'
  end
end

CHOICES = %w(r p sc l sp)
human_selection = ''
computer_selection = ''
winning_outcomes = { "r" => "sc l", "p" => "r sp", "sc" => "p l", "l" => "sp p",
                     "sp" => 'sc r' }
number_computer_wins = 0
number_human_wins = 0

prompt("Welcome to Rock Paper Scissors")

loop do
  loop do
    prompt('Please select
      \'R\' for rock
      \'P\' for paper
      \'SC\' for scissors
      \'L\' for lizard,
      \'SP\' for spock')

    human_selection = gets.chomp

    if CHOICES.include?(human_selection)
      puts "Human selection is #{choice_decode(human_selection)}"
      break
    else
      prompt("That does not appear to be a valid selection")
    end
  end

  computer_selection = CHOICES.sample

  puts "Computer selects #{choice_decode(computer_selection)}"

  winning_human_outcome = winning_outcomes[human_selection].split
  winning_computer_outcome = winning_outcomes[computer_selection].split

  if computer_selection == winning_human_outcome[0] ||
     computer_selection == winning_human_outcome[1]
    puts('Puny Human Wins!')
    number_human_wins += 1
  elsif human_selection == winning_computer_outcome[0] ||
        human_selection == winning_computer_outcome[1]
    puts('Computer Wins!')
    number_computer_wins += 1
  else
    puts('Tie!')
  end

  puts("\n")
  puts("Humans: #{number_human_wins}, Computer #{number_computer_wins}")
  puts("\n")

  if number_human_wins == 5
    puts("Puny Human Wins Match!")
    puts("\n")
    break
  elsif number_computer_wins == 5
    puts("Computer Wins Match!")
    puts("\n")
    break
  end
end

puts("Thanks for playing Rock, Paper, Scissors, Licard, Spock.")
