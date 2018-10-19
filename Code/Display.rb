def display_grid(grid_array)

  print_column_indexes
  print_grid(grid_array)
  print_column_indexes

end

def print_grid(grid_array)

  row_number = 1

  for row in grid_array
    # Generate left row index
    row_string = print_row_index(row_number, true)

    # Add each square from array
    for space in row
      row_string += "#{space} "
    end

    # Generate right row index
    row_string += print_row_index(row_number, false)

    puts row_string

    row_number += 1
  end

end

def print_row_index(row_number, left)
  # Convert number to string
  index_string = row_number.to_s

  # If single digit, add extra space on left
  if row_number < 10 && left
    index_string = " " + index_string
  end

  return index_string + " "

end

def print_column_indexes

  top_line_array = create_alphabet.slice(0, SIZE_OF_GRID_X)

  top_line_string = "   "

  for letter in top_line_array
    top_line_string+= letter
    top_line_string+= " "
  end

  puts top_line_string

end

# Generates an array of the alphabet

def create_alphabet
  return ("A".."Z").to_a
end

# User input validation functions

def check_input (input_string)
  first_grid = input_string[0].upcase
  second_grid = input_string[1..2].to_i

  return first_valid(first_grid) && second_valid(second_grid)
end

def first_valid(letter)
  range_of_letters = create_alphabet.slice(0, SIZE_OF_GRID_X)
  return range_of_letters.include?(letter)
end

def second_valid(number)
  return number > 0 && number <= SIZE_OF_GRID_Y
end

# Final Message to player

def final_message (solution, won)
  display_grid(solution)

  if won
    puts "Congratulations, you are a winner!"
  else
    puts "Whoops, you hit a bomb!"
  end
end

def intro
  puts "********************************"
  puts "*  Paul Wishart's MINESWEEPER  *"
  puts "********************************"
  puts
  puts
  puts 
end
