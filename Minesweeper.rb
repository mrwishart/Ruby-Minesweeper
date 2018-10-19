require_relative('Code/Init.rb')
require_relative('Code/Display.rb')

game_array = generate_grid
# p game_array
add_bombs(game_array)
#p game_array
#p generate_surrounding_spaces(14,19)
uncovered_grid = create_uncovered_grid(game_array)
#p uncovered_grid

display_grid(uncovered_grid)
