require 'date'
require 'csv'

products = {}
menu_items = []

CSV.foreach('products.csv', headers: true) do |row|
  sku = row["SKU"]
  name = row["name"]
  wholesale_price = row["wholesale_price"].to_f
  retail_price = row["retail_price"].to_f

  products[sku] = { "Name" => name,
                    "Wholesale Price" => wholesale_price,
                    "Retail Price" => retail_price }
end

puts "Welcome to James' Coffee Emporium!\n\n"

def print_menu(products, menu)
  count = 1
  products.each do |sku, values|
    puts "#{count}) Add item - $#{'%.2f' % values["Retail Price"]} - #{values["Name"]}"
    menu << sku
    count += 1
  end
  puts "#{count}) Complete Sale\n\n"
  menu << "Complete Sale"
end

print_menu(products)

puts "Make a selection:"

while input = gets.chomp
  if input == menu_items.length
    sale_complete() # ADD THIS METHOD
  else
    subtotal() # ADD THIS METHOD
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




# def total(numbers)
#   total = 0
#   numbers.each do |num|
#     total += num
#   end
#   total
# end

# items = []

# while input = gets.chomp
#   if input == "done"
#     puts "\nHere are your item prices:\n\n"
#     items.each do |num|
#       puts "$#{'%.2f' % num}"
#     end
#     puts "\nThe total amount due is $#{'%.2f' % total(items)}\n\n"
#     break
#   else
#     items << input.to_f
#     puts "\nSubtotal: $#{'%.2f' % total(items)}\n\nWhat is the sale price?"
#   end
# end

# puts "What is the amount tendered?"
# tendered = gets.chomp.to_f

# due = total(items)

# if tendered >= due
#   puts "\n===Thank You!==="
#   puts "The total change due is $#{'%.2f' % (tendered - due)}"
#   puts
#   puts DateTime.now.strftime("%m/%d/%Y %I:%M%p")
#   puts "================"
# else
#   puts "WARNING: Customer still owes $#{'%.2f' % due - tendered} Exiting..."
# end
