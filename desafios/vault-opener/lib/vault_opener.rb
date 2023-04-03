class VaultOpener
  def board_combination(movement_list, repeated_path_time_loss, running_time, max_time)
    moves = movement_list.split(' -> ')
    time = 0 
   
    if moves.size == moves.uniq.size 
      moves.each_with_index do |path, index|
        if index < moves.size - 1
          time += running_time
        end
      end
    elsif moves.uniq.size < moves.size 
      moves.each_with_index do |path, index|
        if index < moves.size - 1
          time = running_time * running_time + repeated_path_time_loss
        end
      end
    end

    if !moves[1..-2].include?('C')
      new_moves = []
      moves.each_with_index do |move, index|
        new_moves << move
        if index < moves.size - 1 && moves[index + 1] != 'C'
          new_moves << 'C'
        end
      end
      moves = new_moves
      time = 0

    moves.each_with_index do |move, index|
      if index < moves.size - 1
        time += running_time
      end
    end

    repeats = moves.group_by{|x| x}.transform_values{|v| v.size}.select{|k,v| v > 1}
    if repeats.any?
      repeated_time = 0
      repeats.each do |repeat, count|
        if count > 1
          repeated_time += (count - 1) * repeated_path_time_loss
        end
      end
      time += repeated_time
    end
    time
    end
  
    if time < max_time
      [ "Cofre aberto", "Tempo sobrando no relógio: #{max_time - time}"] 
    else 
      ["Cofre fechado", "Tempo a mais necessário: #{time - max_time}"]
    end
  end
end

