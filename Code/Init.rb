SIZE_OF_GRID_X = 20
SIZE_OF_GRID_Y = 20
OVERALL_AREA = SIZE_OF_GRID_X * SIZE_OF_GRID_Y
NO_OF_BOMBS = 50

def generate_grid
  new_grid = Array.new(SIZE_OF_GRID_Y) {Array.new(SIZE_OF_GRID_X){|x| x = 0}}

  return new_grid
end

def add_bombs(grid)
  bomb_array = generate_bomb_location

  for bomb in bomb_array
    bomb_x_position = bomb%SIZE_OF_GRID_X
    bomb_y_position = bomb/SIZE_OF_GRID_Y
    grid[bomb_y_position][bomb_x_position] = "B"
  end

end

def generate_bomb_location
  area_array = Array (1..OVERALL_AREA)
  return area_array.sample(NO_OF_BOMBS)
end
