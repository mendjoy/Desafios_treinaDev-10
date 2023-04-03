class MartialTournament
  def placements(match_results, initial_points, rounds)
    all_results = File.readlines(File.join('data', match_results)).map(&:strip)
    points = initial_points.sort_by { |k, v| [-v, k.to_s] }.to_h

    rounds_battles = all_results.slice_before("ROUND").map { |round| round.drop(1) }

    num_rounds = []
    rounds_battles.first(rounds).each_with_index do |round, index|
      round_number = index + 1 
      round_battles = round.map do |battle|
        player1, player2, winner = battle.split(/ x | -> /)
        { player1: player1, player2: player2, winner: winner }
      end
      num_rounds << { round: round_number, battles: round_battles }
    end

    scores = []
    num_rounds.each do |round|
      round_number = round[:round]
      battles = round[:battles]
      round_scores = {}

      battles.each do |battle|
        player1 = battle[:player1].to_sym
        player2 = battle[:player2].to_sym
        winner = battle[:winner].to_sym
        loser = winner == player1 ? player2 : player1

        if points[loser] > points[winner]
          diff = points[loser] - points[winner]
          points[winner] += 1 + diff
          if points[loser] > 0 && diff > 0
            lost_points = [diff, 3].min
            points[loser] -= lost_points
          end
        else
          points[winner] += 1
        end
      end

      position_data = {}
      points.each_with_index do |(player, score), index|
        position_data[index] = { player.to_sym => score }
      end
    
      position_data = position_data.sort_by do |_, data|
        [-data.values.first, -initial_points[data.keys.first], data.keys.first.to_s]
      end

      formatted_data = {}
      position_data.each_with_index do |(position, data), index|
        formatted_data[:"#{index + 1}"] = "#{data.keys.first}:#{data.values.first}"
      end
      scores << formatted_data
    end
    scores
  end
end
