class ArrayUtils
  
  def self.compara(lista1, lista2)
    lista1.sort == lista2.sort
  end

  def self.divisiveis(numero1, numero2)
    divisivel_ambos = []
    divisiveis_num1 = []
    divisiveis_num2 = []
  
    (1..50).each do |num|
      if num % numero1 == 0 && num % numero2 == 0 
        divisivel_ambos << num
      elsif num % numero1 == 0 
        divisiveis_num1 << num
      elsif num % numero2 == 0 
        divisiveis_num2 << num
      end
    end
    [divisivel_ambos, divisiveis_num1, divisiveis_num2]
  end
 
  def self.soma(list)
   resultado = list.sum
  end

  def self.combinar(numeros, letras)
   numeros.product(letras)
  end

end