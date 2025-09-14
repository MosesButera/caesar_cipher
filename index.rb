
def caesar_cipher(my_string, shift = nil)
  return "Please enter shift_factor" if shift_factor.nil?
  return "Input/my_string parameter must be a string" unless my_string.is_a?(String)
  return "Input/shift_factor must be an Integer" unless shift_factor.is_a?(Integer)

  string = my_string.chars    #convert string into array made up on 
  #the string characters so we can use map method on them.

  string.map do |char|
    if char.match?(/[A-Za-z]/)   #checks if the character is an alphabet 
      #character (a-z or A-Z)
      
      #Key pattern that solves the circular calendar wheel. 
      #Very cool :)

      if char.ord.between?(65, 90)  # Uppercase A-Z
        # Wrap inside 65-90
        new_ord = 65 + ((char.ord + shift - 65) % 26)
        new_ord.chr

      end
  
  end

end

