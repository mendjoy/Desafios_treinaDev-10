class Arrays
  def self.multiplica_antecessor_predecessor(array)
    resposta = []
    array.each_with_index do |num, index|
      if index > 0
        predecessor = array[index - 1]
      else
        predecessor = nil
      end
  
      if index < array.length-1
        sucessor = array[index + 1]
      else
        sucessor = nil
      end
  
      if predecessor && sucessor
        resposta << predecessor * sucessor
      elsif predecessor
        resposta << predecessor * num
      elsif sucessor
        resposta << sucessor * num
      end
    end
      resposta
  end  
end
