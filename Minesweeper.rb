require_relative('Code/Init.rb')
require_relative('Code/Display.rb')

game_array = generate_grid(0)
# p game_array
add_bombs(game_array)
#p game_array
#p generate_surrounding_spaces(14,19)
uncovered_grid = create_uncovered_grid(game_array)
#p uncovered_grid
covered_grid = generate_grid("*")

#isplay_grid(uncovered_grid)

no_of_uncovered = 0

no_of_uncovered = uncover_square(covered_grid, uncovered_grid, 0, 0, [], no_of_uncovered)

# if has_lost(covered_grid)
#   puts "Ha, fucking loser!"
# end

# if has_won(no_of_uncovered)
#   puts "You've won!"
# end
#uncover_square(covered_grid, uncovered_grid, 19, 19, [])
#uncover_square(covered_grid, uncovered_grid, 4, 7, [])

win = has_won(no_of_uncovered)
lose = has_lost(covered_grid)

until (win || lose) do

  display_grid(covered_grid)

  choice_valid = false

  until choice_valid do
    puts "Please enter grid reference (e,g M16):"
    user_choice = gets.chomp
    choice_valid = check_input(user_choice)
  end

  x_coord = create_alphabet.index(user_choice[0].upcase)
  #p x_coord
  y_coord = user_choice[1..2].to_i

  #p no_of_uncovered
  no_of_uncovered = uncover_square(covered_grid, uncovered_grid, x_coord, y_coord-1, [], no_of_uncovered)

  if has_won(no_of_uncovered)
    puts "Congratulations, you have won!"
    break
  end
  if has_lost(covered_grid)
    puts "Whoops! You clicked on a bomb!"
    break
  end

  puts "There are still #{WINNING_STATE - no_of_uncovered} squares left!"
end

display_grid(uncovered_grid)
