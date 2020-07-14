# require 'csv'
require_relative 'scrapper'
# require_relative 'interface'

def display_menu
  puts "What action do you want to do ?"
  puts "1 - List all gifts"
  puts "2 - Add a gift"
  puts "3 - Delete a gift"
  puts "4 - Mark as bought"
  puts "5 - Find Ideas in etsy"
  puts "0 - Exit"
end

def display_gifts(gifts)
  puts "----YOUR LIST ----"
  gifts.each_with_index do |gift, index|
    if gift[:bought] == true
      bought_details = "[X]"
    else
      bought_details = "[ ]"
    end
    # bought_details = gift[:bought] ? "[X]" : "[ ]"
    puts "#{index + 1} - #{gift[:name]} - #{gift[:price]}€ #{bought_details} "
  end
  puts "-"*20
end

def add_gifts(gifts)
  # Ask User Gift Details
  puts "What is the name of the gift ?"
  name = gets.chomp
  puts "What is the price of the gift ?"
  price = gets.chomp.to_i
  # Store details
  new_gift = {
    name: name,
    price: price,
    bought: false
  }
  # Create a variable gift with format hash
  # Ajouter le gift dans gifts
  gifts << new_gift
end

def delete_gift(gifts)
  # display gifts
  puts "What do you want to delete ? Choose index"
  display_gifts(gifts)
  # Ask User index of gift to delete & Stock index
  index = gets.chomp.to_i - 1
  # Identifier gift to delete at index - 1
  gifts.delete_at(index)
  # array.delete_at(index)
  display_gifts(gifts)
end

def mark_as_bought(gifts)
  # display gifts
  # Ask User index of gift to mark as bought & Stock index
  # Identifier gift at index - 1
  puts "Which gift have you bought ?"
  display_gifts(gifts)
  index = gets.chomp.to_i - 1
  # Update la valeur de clé bought dans le gift hash[:key] = new_value
  gifts[index][:bought] = true
  display_gifts(gifts)
end

def ideas_etsy(gifts)
  # Ask User Keyword
  puts "What are you looking for ?"
  keyword = gets.chomp
  # Scrap with keyword
  ideas = scrap(keyword)
  # Display ideas
  display_gifts(ideas)
  # Ask User to Choose the idea he wants to add / index
  puts "Select the idea you want to add"
  index = gets.chomp.to_i - 1
  # Add gift_idea to gifts
  gift_to_add = ideas[index]
  gifts << gift_to_add
  display_gifts(gifts)
end
