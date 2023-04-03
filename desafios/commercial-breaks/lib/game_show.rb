class GameShow
  def commercial_breaks(breaks, maximum_time)
    results = []

    if breaks.length <= 3
      breaks.each_with_index do |break_time, index|
        results << [index] if break_time == maximum_time
      end
      return results
    end

    if breaks.length == 4
      (0..2).each do |i|
        (i+1..3).each do |j|
          if breaks[i] + breaks[j] == maximum_time
            results << [i, j]
          end
        end
      end
      return results
    end

    if breaks.length > 4
    (3..5).each do |num_breaks|
      breaks.combination(num_breaks).each do |combination|
        if combination.sum == maximum_time
          combination_indices = combination.map { |item| breaks.index(item) }
          results << combination_indices.sort
        end
      end
    end
  end

  if breaks.length > 5
    result = []
    breaks.combination(5).each do |combination|
      sum = combination.sum
      if sum <= maximum_time
        if result.empty? || (maximum_time - sum) < (maximum_time - result.sum)
          result = combination
        end
      end
    end
    return [result.map { |item| breaks.index(item) }]
  end
    results
  end
end
