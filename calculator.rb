Kernel.puts('Please enter the first number.')
first_number = Kernel.gets().chomp().to_f

Kernel.puts('Please enter the second number.')
second_number = Kernel.gets().chomp().to_f

Kernel.puts('Do you want to add, subtract, multiply, or divide?')
operation = Kernel.gets().chomp()

# result = nil

result = case operation
  when 'add' then first_number + second_number
  when 'subtract' then first_number - second_number
  when 'multiply' then first_number * second_number
  when 'divide' then first_number / second_number
end

puts result