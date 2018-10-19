require_relative('Code/Init.rb')
require_relative('Code/Display.rb')
require_relative('Code/GameMechanics.rb')

#Initialize game array

game_array = generate_grid(0)

# Add bombs to the array

add_bombs(game_array)

# Create the completed grid

uncovered_grid = create_uncovered_grid(game_array)

# Generate blank grid for player display

covered_grid = generate_grid("*")

# No squares uncovered yet

no_of_uncovered = 0

# Uncover top left corner to start

no_of_uncovered = uncover_square(covered_grid, uncovered_grid, 0, 0, [], no_of_uncovered)


# In case someone cheats and reduces the number of bombs
win = has_won(no_of_uncovered)

lose = false

#Display intro
intro

until (win || lose) do

  # Show player the grid
  display_grid(covered_grid)

  puts "There are still #{WINNING_STATE - no_of_uncovered} squares left!"

  # Assume user input is wrong until proven otherwise
  choice_valid = false

  until choice_valid do
    puts "Please enter grid reference (e,g M16):"
    user_choice = gets.chomp

    choice_valid = check_input(user_choice)
  end

  x_coord = create_alphabet.index(user_choice[0].upcase)

  y_coord = user_choice[1..2].to_i

=begin
  Uncover square requires:
    - Player grid
    - Solution grid
    - X-coordinate
    - Y-coordinate
    - Exclusion array (blank to begin with)
    - Current number of uncovered squares
=end
  no_of_uncovered = uncover_square(covered_grid, uncovered_grid, x_coord, y_coord-1, [], no_of_uncovered)

  # Update win and loss states
  win = has_won(no_of_uncovered)
  lose = has_lost(covered_grid)

end

final_message(uncovered_grid, win)
