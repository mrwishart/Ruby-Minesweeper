SIZE_OF_GRID_X = 20 #Maximum is 26, do not exceed!
SIZE_OF_GRID_Y = 20
OVERALL_AREA = SIZE_OF_GRID_X * SIZE_OF_GRID_Y
NO_OF_BOMBS = 50
WINNING_STATE = OVERALL_AREA - NO_OF_BOMBS
BOMB_CHAR = "@"

def generate_grid(initial_value)
  new_grid = Array.new(SIZE_OF_GRID_Y) {Array.new(SIZE_OF_GRID_X){|x| x = initial_value}}

  return new_grid
end

def add_bombs(grid)
  bomb_array = generate_bomb_location
  for bomb in bomb_array
    bomb_x_position = bomb%SIZE_OF_GRID_X
    bomb_y_position = bomb/SIZE_OF_GRID_X
    #p "x = #{bomb_x_position}"
    #p "y = #{bomb_y_position}"
    grid[bomb_y_position][bomb_x_position] = BOMB_CHAR
  end

end

def generate_bomb_location
  area_array = Array (1..OVERALL_AREA-1)
  return area_array.sample(NO_OF_BOMBS)
end
