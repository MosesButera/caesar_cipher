
def caesar_cipher(my_string, shift = nil)
  return "Please enter shift_factor" if shift_factor.nil?
  return "Input/my_string parameter must be a string" unless my_string.is_a?(String)
  return "Input/shift_factor must be an Integer" unless shift_factor.is_a?(Integer)

  string = my_string.chars    #convert string into array made up on 
  #the string characters so we can use map method on them.

  string.map do |char|
    




  end


end

