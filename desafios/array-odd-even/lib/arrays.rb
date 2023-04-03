class Arrays
  def self.converte_impares_por(lista, numero)
    array_odd = []
    lista.map { |n| array_odd << n if n.odd?}
    array_odd = [array_odd, array_odd.map{ |n| n * numero}]
  end

  def self.converte_pares_por(lista, numero)
    array_even = []
    lista.map { |n| array_even << n if n.even?}
    array_even = [array_even, array_even.map{ |n| n * numero}]
  end
end
