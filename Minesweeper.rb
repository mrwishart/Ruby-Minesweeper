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

uncover_square(covered_grid, uncovered_grid, 0, 0, [])
#uncover_square(covered_grid, uncovered_grid, 19, 19, [])
#uncover_square(covered_grid, uncovered_grid, 4, 7, [])

display_grid(covered_grid)
