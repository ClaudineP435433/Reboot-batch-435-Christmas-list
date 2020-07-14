require_relative 'methods'

puts "-"*30
puts "Welcome to the Christmas List"
puts "-"*30

GIFTS = [
  {name: "MacBook pro", price: 1350 , bought: false},
  {name: "Key Ring", price: 3 , bought: true},
  {name: "Bottle Opener", price: 13 , bought: false}
]

loop do
  # What do you want to do ?
  display_menu
  print ">"
  action = gets.chomp
  case action
  when '1' then display_gifts(GIFTS)
  when '2' then add_gifts(GIFTS)
  when '3' then delete_gift(GIFTS)
  when '4' then mark_as_bought(GIFTS)
  when '5' then ideas_etsy(GIFTS)
  when '0' then break
  else
    puts "Wrong choice!"
  end
end
