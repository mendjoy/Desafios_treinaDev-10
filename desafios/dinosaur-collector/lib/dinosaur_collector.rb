class DinosaurCollector
  def toy_collecting(toys_positions, dino_position, battery)
    route = [dino_position]
    collected = []
    
    while !toys_positions.empty?
      sorted_toys = toys_positions.sort_by do |toy_position|
        Math.sqrt((dino_position[0] - toy_position[0]) ** 2 + (dino_position[1] - toy_position[1]) ** 2)
      end

      closest_toy = sorted_toys[0]
      distance_to_toy = Math.sqrt((dino_position[0] - closest_toy[0]) ** 2 + (dino_position[1] - closest_toy[1]) ** 2)
      dino_position = closest_toy
      collected << closest_toy
      toys_positions.reject! { |toy| toy == closest_toy }
      battery -= distance_to_toy
      route << dino_position

      if distance_to_toy > battery
        break
      end

    end
    [route, collected.length, battery.round(2)]
  end  
end