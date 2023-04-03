class DataControl
  def initialize(data_list)
    @data_list = data_list
  end

  def validate_data_list
    invalid = []

    @data_list.each_with_index do |data, index|
      if Validator.new(data).data_checker == "Inválido"
        invalid << index
      end 
    end

    if invalid.empty?
      'Todos são válidos'
    else 
      invalid
    end

  end
end