def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(number)
  number.to_i() != 0
end

def operation_to_message(op)
  case op
  when 'add'
    'Adding'
  when 'subtract'
    'Subtracting'
  when 'multiply'
    'Multiplying'
  when 'divide'
    'Dividing'
  end
end

prompt("Welcome to Calculator!  Enter your name.")

name = ''
loop do
name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop

  first_number = nil
  loop do
    prompt('Please enter the first number.')
    first_number = Kernel.gets().chomp().to_i
    
    if valid_number?(first_number)
      break
    else
      prompt("Hmm...that doesn't look like a valid number.")
    end
  end
  
  second_number = nil
  loop do
    prompt('Please enter the second number.')
    second_number = Kernel.gets().chomp().to_i
    
    if valid_number?(second_number)
      break
    else
      prompt("Hmm...that doesn't look like a valid number.")
    end
  end
  
  operation_prompt = <<-MSG
    Do you want to:
      - Add
      - Subtract
      - Multiply
      - Divide
  MSG

  prompt(operation_prompt)

  operation = nil
  loop do
    operation = Kernel.gets().chomp().downcase
    
    if %w(add subtract multiply divide).include?(operation)
      break
    else
      prompt("Must type add, subtract, multiply, or divide.")
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers...")

  result = case operation
    when 'add' then first_number + second_number
    when 'subtract' then first_number - second_number
    when 'multiply' then first_number * second_number
    when 'divide' then first_number / second_number
  end
  
  prompt("The result is #{result}")
  
  prompt("Do you want to perform another calculation? (y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with? ('y')
end

prompt("Thank you for using the calculator.  Good bye!")