class WordPuzzle 
  def phrase_weight(phrases) 
    abecedario_valores = Hash[('a'..'z').zip(1..26)]
    palavras_valor = []

    phrases.each do |palavra| 
      valor_palavra = 0
  
      palavra.each_char do |letra|
        valor_letra = abecedario_valores[letra]
        letra == letra.upcase
        
      end

      palavras_valor << valor_palavra 
    end 

    palavras_valor 
  end 
end
