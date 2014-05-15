require 'date'

puts "What is the amount due?"
due = gets.chomp.to_f

puts "What is the amount tendered?"
tendered = gets.chomp.to_f

if tendered >= due
  puts "===Thank You!==="
  puts "The total change due is $#{'%.2f' % (tendered - due)}"
  puts
  puts DateTime.now.strftime("%m/%d/%Y %I:%M%p")
  puts "================"
else
  puts "WARNING: Customer still owes $#{'%.2f' % due - tendered} Exiting..."
end
