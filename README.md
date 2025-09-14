# caesar_cipher

🔐 Caesar Cipher - Ruby Implementation

A robust Ruby implementation of the classic Caesar cipher encryption technique, featuring comprehensive input validation and the elegant modular arithmetic solution to the "alphabet wrapping" problem.


## 🎯 Project Overview

### What is a Caesar Cipher?
The Caesar cipher is one of the oldest known encryption techniques, named after Julius Caesar who used it to protect military communications. It works by shifting each letter in the plaintext by a fixed number of positions in the alphabet.

### Project Expectations
This implementation goes beyond a basic Caesar cipher by:
- ✅ Handling both uppercase and lowercase letters
- ✅ Preserving non-alphabetic characters (spaces, punctuation)
- ✅ Managing large shift values through modular arithmetic
- ✅ Providing comprehensive input validation
- ✅ Solving the circular alphabet problem elegantly

---

## ⚡ Features

### 🔧 Core Functionality
- **Bidirectional Encryption**: Works with any positive or negative shift value
- **Case Preservation**: Maintains original letter casing
- **Unicode Handling**: Uses ASCII values for precise character manipulation
- **Wrap-Around Logic**: Handles shifts larger than 26 seamlessly
- **Non-Destructive**: Leaves spaces, numbers, and symbols untouched

### 🛡️ Input Validation
- **String Validation**: Ensures input is a valid string
- **Integer Validation**: Verifies shift factor is an integer
- **Nil Protection**: Handles missing parameters gracefully
- **Type Safety**: Prevents runtime errors through early validation

### 🎨 Code Quality
- **Readable Logic**: Clear variable names and comments
- **Modular Design**: Single responsibility principle
- **Error Messages**: Descriptive feedback for invalid inputs
- **Ruby Idioms**: Uses `.chars`, `.map`, and `.join` for clean array manipulation

---

## 🧠 Core Problem-Solving Concepts

### 1. **The Circular Alphabet Challenge** 🔄

**The Problem**: When shifting letters near the end of the alphabet, how do you wrap back to the beginning?

Example: `'Z' + 1 = 'A'` (not `'['`)

**The Elegant Solution**: Modular Arithmetic Pattern

```ruby
# The magic formula that solves circular wrapping:
new_ord = base_value + ((char.ord + shift - base_value) % 26)

# Where:
# base_value = 65 (for 'A') or 97 (for 'a')
# char.ord = ASCII value of current character
# % 26 = ensures we stay within alphabet bounds
```

### 2. **ASCII Manipulation Strategy** 📊

Instead of working with letters directly, the code converts to ASCII values:
- `'A'` = 65, `'B'` = 66, ..., `'Z'` = 90
- `'a'` = 97, `'b'` = 98, ..., `'z'` = 122

This allows mathematical operations on characters!

### 3. **Dual Case Handling Pattern** 🔤

```ruby
if char.ord.between?(65, 90)      # Uppercase range
    new_ord = 65 + ((char.ord + shift - 65) % 26)
elsif char.ord.between?(97, 122)  # Lowercase range  
    new_ord = 97 + ((char.ord + shift - 97) % 26)
end
```

### 4. **Functional Programming Approach** 🔗

The solution uses Ruby's functional methods:
- `.chars` → Convert string to character array
- `.map` → Transform each character
- `.join` → Reconstruct the string

---

## 📋 Pseudocode

```
FUNCTION caesar_cipher(input_string, shift_amount):
    
    // Input Validation Phase
    IF shift_amount is null:
        RETURN error message about missing shift
    IF input_string is not a string:
        RETURN error message about string requirement
    IF shift_amount is not an integer:
        RETURN error message about integer requirement
    
    // Processing Phase
    character_array = CONVERT input_string to array of characters
    
    FOR EACH character in character_array:
        IF character is alphabetic (A-Z or a-z):
            
            // Determine if uppercase or lowercase
            IF character is uppercase (ASCII 65-90):
                base_ascii = 65
            ELSE IF character is lowercase (ASCII 97-122):
                base_ascii = 97
            
            // Apply circular shift formula
            original_ascii = GET ASCII value of character
            shifted_position = (original_ascii + shift_amount - base_ascii) MOD 26
            new_ascii = base_ascii + shifted_position
            character = CONVERT new_ascii back to character
            
        ELSE:
            // Keep non-alphabetic characters unchanged
            character = character
    
    RETURN JOIN all characters back into string
```

---

## 🔬 The Mathematics Behind the Magic

### Understanding the Modular Arithmetic

Let's break down why `((char.ord + shift - 65) % 26)` works:

1. **Normalize to 0-25 range**: `char.ord - 65`
   - 'A' (65) becomes 0, 'B' (66) becomes 1, ..., 'Z' (90) becomes 25

2. **Apply the shift**: `+ shift`
   - If 'A' (0) shifts by 3: `0 + 3 = 3` → 'D'

3. **Handle overflow with modulo**: `% 26`
   - If 'Z' (25) shifts by 3: `(25 + 3) % 26 = 2` → 'C'

4. **Convert back to ASCII**: `65 +`
   - Add the base value to get proper ASCII code

### Visual Example

```
Original: "HELLO"
Shift: 3

H(72) → (72-65+3)%26 = 10%26 = 10 → 65+10 = 75 → 'K'
E(69) → (69-65+3)%26 = 7%26 = 7   → 65+7 = 72  → 'H' 
L(76) → (76-65+3)%26 = 14%26 = 14 → 65+14 = 79 → 'O'
L(76) → (76-65+3)%26 = 14%26 = 14 → 65+14 = 79 → 'O'
O(79) → (79-65+3)%26 = 17%26 = 17 → 65+17 = 82 → 'R'

Result: "KHOOR"
```

---

## 🚀 Getting Started

### Prerequisites
- Ruby 2.7+ installed on your system
- Basic understanding of Ruby syntax

### Installation & Usage

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/caesar-cipher-ruby.git
cd caesar-cipher-ruby
```

2. **Run the script**
```bash
ruby caesar_cipher.rb
```

3. **Use in your code**
```ruby
# Basic usage
result = caesar_cipher("Hello World!", 3)
puts result  # "Khoor Zruog!"

# Negative shifts (decryption)
decrypted = caesar_cipher("Khoor Zruog!", -3)
puts decrypted  # "Hello World!"

# Large shifts
result = caesar_cipher("ABC", 100)
puts result  # "OPQ" (100 % 26 = 22)
```

---

## 🧪 Test Cases

| Input | Shift | Expected Output | Test Case |
|-------|-------|-----------------|-----------|
| `"abc"` | `1` | `"bcd"` | Basic lowercase |
| `"ABC"` | `1` | `"BCD"` | Basic uppercase |
| `"xyz"` | `3` | `"abc"` | Wrap around |
| `"Hello, World!"` | `13` | `"Uryyb, Jbeyq!"` | Mixed case with punctuation |
| `"ZYXW"` | `4` | `"DCBA"` | Reverse wrap |
| `""` | `5` | `""` | Empty string |
| `"123!@#"` | `10` | `"123!@#"` | Non-alphabetic only |

---

## 🎨 Code Style & Patterns

### Ruby Best Practices Used
- **Guard Clauses**: Early returns for invalid inputs
- **Descriptive Method Names**: `caesar_cipher` clearly states purpose
- **Meaningful Variable Names**: `new_ord`, `shift_factor`
- **Single Responsibility**: Function does one thing well
- **Immutable Input**: Original string remains unchanged

### Design Patterns
- **Template Method**: Consistent structure for both cases
- **Strategy Pattern**: Different handling for upper/lower case
- **Fail Fast**: Input validation before processing

---

## 🔍 Error Handling

The function gracefully handles various error conditions:

```ruby
# Missing shift parameter
caesar_cipher("hello")
# → "Please enter shift_factor"

# Invalid string input
caesar_cipher(123, 5)
# → "Input/my_string parameter must be a string"

# Invalid shift input  
caesar_cipher("hello", "five")
# → "Input/shift_factor must be an Integer"
```

---










































































