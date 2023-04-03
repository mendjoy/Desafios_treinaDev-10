class CaveClimber
  def treasure_path(map, positions, h_andre, h_kana)

    kana_path = verify_paths(positions[:kana], 'Kana', h_kana, map, positions[:tesouro])
    andre_path = verify_paths(positions[:andre], 'André', h_andre, map, positions[:tesouro] )

    validate_paths(andre_path, kana_path)
  end


  def validate_paths(andre_path, kana_path)
   
    if andre_path == "Path Not Found" && kana_path == "Path Not Found"
      return "No paths available"
    elsif andre_path == "Path Not Found"
      return kana_path
    elsif kana_path == "Path Not Found"
      return andre_path
    end
    
    kana_steps = kana_path.split(' -> ')
    andre_steps = andre_path.split(' -> ')
    
    strike = []
    kana_steps.each_with_index do |clash, index|
      if clash == andre_steps[index]
        strike <<  clash
      end
    end
    strike

    cut = ' -> ' + strike[0].to_s
    pos_kana = kana_path.index("#{cut}")
    pos_andre = andre_path.index("#{cut}")
    
    if !strike.empty?
      kana_new = kana_path.slice(0, pos_kana + cut.length)
      andre_new = andre_path.slice(0, pos_andre + cut.length)
      return "Encontro: #{kana_new} | #{andre_new}"
    end
    
    if kana_path && andre_path
      if andre_path.size < kana_path.size
        return andre_path
      elsif kana_path.size < andre_path.size
        return kana_path
      end
    end

  end

  def verify_paths(climber_position, name_climber, height_limit, map, treasure_position)
    directions = [[-1, 0], [0, 1], [1, 0], [0, -1]]
    visited = [climber_position]
    to_visit = [climber_position]

    paths = {climber_position => "#{name_climber}: #{climber_position}"}

    while !to_visit.empty?
      current_position = to_visit.shift

      directions.each do |dir|
        next_position = [current_position[0] + dir[0], current_position[1] + dir[1]]
        if next_position[0] >= 0 && next_position[0] < map.size && next_position[1] >= 0 && next_position[1] < map[0].size
          if !visited.include?(next_position)
            height_diff = (map[next_position[0]][next_position[1]] - map[current_position[0]][current_position[1]]).abs
            if height_diff <= height_limit
              to_visit << next_position
              visited << next_position
              paths[next_position] = paths[current_position] + " -> #{next_position}"
                if next_position == treasure_position
                  return paths[next_position]
                end
            end
         end
       end
     end
   end
  return "Path Not Found"

  end

end