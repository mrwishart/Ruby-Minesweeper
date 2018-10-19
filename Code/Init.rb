SIZE_OF_GRID_X = 20 #Note: Maximum is 26, do not exceed!
SIZE_OF_GRID_Y = 20
OVERALL_AREA = SIZE_OF_GRID_X * SIZE_OF_GRID_Y
NO_OF_BOMBS = 5
WINNING_STATE = OVERALL_AREA - NO_OF_BOMBS
BOMB_CHAR = "@"

def generate_grid(initial_value)

  # Create 2-dimensional grid
  new_grid = Array.new(SIZE_OF_GRID_Y) {Array.new(SIZE_OF_GRID_X){|x| x = initial_value}}

  return new_grid
end

def add_bombs(grid)

  # Create list of bomb locations
  bomb_array = generate_bomb_location

  for bomb in bomb_array

    bomb_x_position = bomb%SIZE_OF_GRID_X
    bomb_y_position = bomb/SIZE_OF_GRID_X

    grid[bomb_y_position][bomb_x_position] = BOMB_CHAR

  end

end

def generate_bomb_location
  # List from 1 so that top-left corner is always safe
  area_array = Array (1..OVERALL_AREA-1)

  return area_array.sample(NO_OF_BOMBS)

end

# Generates an uncovered version of the game to compare player grid to

def create_uncovered_grid(game_array)

  uncovered_grid = game_array.dup

  for y in 0..uncovered_grid.length-1
    for x in 0..uncovered_grid[y].length-1
      # If current square isn't a bomb...
      if !is_bomb(uncovered_grid[y][x])
        # ...replace with number of surrounding bombs
        uncovered_grid[y][x] = count_surround_spaces(x, y, game_array)

      end

    end
  end

  return uncovered_grid

end

# Counts all of the surrounding spaces for bombs

def count_surround_spaces(x, y, game_array)

  # Get an array of all possible surrouding squares
  spaces_to_check = generate_surrounding_spaces(x, y)

  bombs_counted = 0

  for space in spaces_to_check
    space_y = space[0]
    space_x = space[1]

    bombs_counted += 1 if is_bomb(game_array[space_y][space_x])

  end

  return bombs_counted

end

# Generates surrounding squares, eliminating some if its an edge or corner

def generate_surrounding_spaces(x, y)
   surround_array = []
# Loop over 3x3 grid
  for i in x-1..x+1
    for j in y-1..y+1
      # Exclude the center square and ones not on the grid
      if ((i==x) && (j==y)) || !is_on_grid(i,j)
        next
      end
      surround_array.push([j, i])
    end
  end

  return surround_array
end
