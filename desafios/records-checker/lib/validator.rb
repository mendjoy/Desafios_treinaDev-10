class Validator
  def initialize(data)
    @data = data 
  end

  def validate_name
    result = []
    name = @data[:nome_completo]
    if name.match?(/^\p{L}+(?: \p{L}+)*$/u) && name.split.length >= 2
      result << 'Válido'
    else 
      result << 'Inválido'
    end
  end

  def validate_birthday
    result = []
    birthday = @data[:aniversario].split('/')
    day = birthday[0].to_i
    month = birthday[1].to_i
    year = birthday[2].to_i
  
    if !(1..12).include?(month) || !(1..31).include?(day) || Time.new(year, month, day) > Time.now
      result << 'Inválido'
    else 
      result << 'Válido'
    end
  end
  
  def validate_password
    result = []
    password = @data[:senha]
    if password.length >= 8 && password.match?(/[A-Z]/) && password.match?(/\d/)
      result << 'Válido'
    else 
      result << 'Inválido'
    end
  end

  def validate_cpf 
    result = []
    cpf = @data[:cpf]
    
    if cpf.length < 11
      result << 'Inválido'
    end

    sum1 = 0 
    (0..8).each do |i|
      sum1 += cpf[i].to_i * (10 - i)
    end

    rest1 = sum1 % 11
    digit_1 = 11 - rest1
    digit_1 = 0 if digit_1 > 9

    sum2 = 0 
    (0..9).each do |i|
      sum2 += cpf[i].to_i * (11 - i)
    end
  
    rest2 = sum2 % 11
    digit_2 = 11 - rest2
    digit_2 = 0 if digit_2 > 9

    if cpf[9].to_i == digit_1 && cpf[10].to_i == digit_2
      result << 'Válido'
    else
      result << 'Inválido'
    end
  end
  
  def data_checker
    result = validate_name + validate_birthday + validate_password + validate_cpf
    
    if result.all? { |validator| validator == 'Válido'}
      'Válido'
    else
      'Inválido'
    end
    
  end
end