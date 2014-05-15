require 'date'

def total(numbers)
  total = 0
  numbers.each do |num|
    total += num
  end
  total
end

items = []

puts "What is the sale price?"

while input = gets.chomp
  if input == "done"
    puts "\nHere are your item prices:\n\n"
    items.each do |num|
      puts "$#{'%.2f' % num}"
    end
    puts "\nThe total amount due is $#{'%.2f' % total(items)}\n\n"
    break
  else
    items << input.to_f
    puts "\nSubtotal: $#{'%.2f' % total(items)}\n\nWhat is the sale price?"
  end
end

puts "What is the amount tendered?"
tendered = gets.chomp.to_f

due = total(items)

if tendered >= due
  puts "\n===Thank You!==="
  puts "The total change due is $#{'%.2f' % (tendered - due)}"
  puts
  puts DateTime.now.strftime("%m/%d/%Y %I:%M%p")
  puts "================"
else
  puts "WARNING: Customer still owes $#{'%.2f' % due - tendered} Exiting..."
end
