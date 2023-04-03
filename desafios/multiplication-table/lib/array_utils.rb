class ArrayUtils

  def self.multiplos(qtd, multiplo)
    (1..qtd).map { |n| n * multiplo }
  end

  def self.tabuada (number)
    (1..number).map do |n|
      (1..10).map { |i| n * i}
    end
  end
end
