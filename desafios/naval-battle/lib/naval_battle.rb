class NavalBattle
  def initialize(player_a, player_b, matrix_size, attacks)
    @player_a = player_a
    @player_b = player_b
    @matrix_size = matrix_size
    @attacks = attacks
  end

  def create_matrix(matrix_size)
    rows, cols = @matrix_size.split('x').map(&:to_i)
    matrix = Array.new(rows) { Array.new(cols, '0') }
    return matrix
  end

  def place_ships(player_ship_a, player_ship_b)
    ships = [
      { name: 'porta_avioes',    letter: 'P', },
      { name: 'navio_de_guerra', letter: 'N', },
      { name: 'submarino',       letter: 'S', },
      { name: 'cruzador',        letter: 'C', },
      { name: 'corveta',         letter: 'c', },
      { name: 'boias',           letter: 'B', },
    ]

    matrix_a = create_matrix(@matrix_size)
    matrix_b = create_matrix(@matrix_size)

    player_ship_a.each do |ship_name, positions|
      ship_letter = ships.find { |s| s[:name] == ship_name.to_s }[:letter]
      positions.each do |pos|
        row, col = pos
        matrix_a[row][col] = ship_letter
      end
    end

    player_ship_b.each do |ship_name, positions|
      ship_letter = ships.find { |s| s[:name] == ship_name.to_s }[:letter]
      positions.each do |pos|
        row, col = pos
        matrix_b[row][col] = ship_letter
      end
    end
   return matrix_a, matrix_b
  end

  def battle_attacks(attacks, matrix_a, matrix_b)
    points_a = 0
    points_b = 0
    
    attacks.split("\n").each do |line|
      next if line.strip.empty?
      player, coordinates = line.strip.split(" -> ")
      row, col = coordinates.scan(/\d+/).map(&:to_i)
  
      matrix = (player == "A") ? matrix_b : matrix_a
  
      if row >= 0 && row < matrix.size && col >= 0 && col < matrix[0].size
        if matrix[row][col] != "X"
          if player == "A"
            points_a = calculate_points([row, col], matrix_b, points_a)
          elsif player == "B"
            points_b = calculate_points([row, col], matrix_a, points_b)
          end
        end
        matrix[row][col] = "X"
      end
    end

    return points_a, points_b, matrix_a, matrix_b
  end
  
  def calculate_points(attack_pos, opponent_matrix, points)
    case opponent_matrix[attack_pos[0]][attack_pos[1]]
      when 'P'
        points += 1
      when 'N'
        points += 2
      when 'S', 'C'
        points += 3
      when 'c'
        points += 5
      when 'B'
        points -=3
    end

    if opponent_matrix.flatten.count(opponent_matrix[attack_pos[0]][attack_pos[1]]) == 1 && opponent_matrix[attack_pos[0]][attack_pos[1]] != 'B'
      points += 3
    end
    points

  end
  
  def result
    initial_matrix_a, initial_matrix_b = place_ships(@player_a, @player_b)
    points_a, points_b, attacked_matrix_a, attacked_matrix_b = battle_attacks(@attacks, initial_matrix_a, initial_matrix_b)

    if points_a > points_b
      return { vencedor: 'Jogador A', pontos_a: points_a, pontos_b: points_b, matriz: attacked_matrix_b}
    else 
      return { vencedor: 'Jogador B', pontos_a: points_a, pontos_b: points_b, matriz: attacked_matrix_a}
    end

  end
end