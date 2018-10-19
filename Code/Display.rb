def display_grid(grid_array)
  top_line_array = create_alphabet.slice(0, SIZE_OF_GRID_X)

  top_line_string = "   "

  for letter in top_line_array
    top_line_string+= letter
    top_line_string+= " "
  end

  puts top_line_string

  row_number = 1

  for row in grid_array
    #puts ""
    row_string = "#{row_number} "
    if row_number < 10
      row_string = " " + row_string
    end
    for space in row
      row_string += "#{space} "
    end
    puts row_string
    row_number += 1
  end
end

# Generates an array of the alphabet

def create_alphabet
  return ("A".."Z").to_a
end

# Generates an uncovered version of the game (either for a win or loss)

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

  for i in x-1..x+1
    for j in y-1..y+1
      if ((i==x) && (j==y)) || !is_on_grid(i,j)
        next
      end
      surround_array.push([j, i])
    end
  end

  return surround_array
end

def uncover_square(player, solution, x, y, exclude)
  player[y][x] = solution [y][x]
  exclude.push([y,x])
  if solution [y][x] == 0
    surround = generate_surrounding_spaces(x,y)
    for space in surround
      if !exclude.include?(space)
        uncover_square(player, solution, space[1], space[0], exclude)
      end
    end
  end

end


def is_bomb(space)
  return space == BOMB_CHAR
end

def is_on_grid(x,y)
  if x < 0 || x >= SIZE_OF_GRID_X
    return false
  elsif y < 0 || y >= SIZE_OF_GRID_Y
    return false
  else
    return true
  end
end
