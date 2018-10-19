#Main Function: Takes uncovered square from the solution and put it into the player display

# Will call itself if the player hits a 0; exclude array is to avoid it repeating the same squares indefinitely

def uncover_square(player, solution, x, y, exclude, uncovered_sqs)

  # Check square hasn't already been uncovered
  if player[y][x]!= solution [y][x]

    # Move square from solution to player display
    player[y][x] = solution [y][x]

    # Add another uncovered square to total
    uncovered_sqs+=1

    # In case the player hits 0 and to avoid infinite iteration, exlude array stops program from going over the same square twice
    exclude.push([y,x])

    if solution [y][x] == 0

      surround = generate_surrounding_spaces(x,y)

      for space in surround
        #If current space hasn't already been uncovered
        if !exclude.include?(space)

          uncovered_sqs = uncover_square(player, solution, space[1], space[0], exclude, uncovered_sqs)

        end

      end
    end
  end

  return uncovered_sqs

end

# Is this square a bomb?

def is_bomb(space)
  return space == BOMB_CHAR
end

# Is square on the grid (used to avoid surrounding squares going of the grid)

def is_on_grid(x,y)
  if x < 0 || x >= SIZE_OF_GRID_X
    return false
  elsif y < 0 || y >= SIZE_OF_GRID_Y
    return false
  else
    return true
  end
end

# Has the player won?

def has_won(uncovered)
  return uncovered == WINNING_STATE
end

# Has the player lost?

def has_lost(player_array)
  for row in player_array
    return true if row.include?(BOMB_CHAR)
  end
  return false
end
