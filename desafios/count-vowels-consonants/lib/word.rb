class Word

  def vowels_count(phrase)
    phrase.downcase.count('aáàãeéiíoóôuúy')
  end

  def consonants_count(phrase)
    phrase.downcase.count('bcdfghjklmnpqrstvwxz')
  end
end
