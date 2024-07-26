class Inventory
    @@hash = Hash.new 
  
    def initialize
      run 
    end

    def run 
        @exit_symbol = true
         wrong_option = 0
  
      while @exit_symbol
        introInventoryManagement
  
        number = gets.chomp.to_i
        case number
        when 1
          addItem
        when 2
          removeItem
        when 3
          updateItem
        when 4
          viewItem
        when 5
          searchItem
        when 6
          @exit_symbol = false
        else
          showWarning(number)
          wrong_option += 1
          if wrong_option < 4
            redo
          else
            puts "You have exceeded the maximum number of attempts (3). Exiting the inventory system."
            @exit_symbol = false
          end
        end
      end
    end

  
    def introInventoryManagement
      puts "Inventory Management System"
      puts "1. Add item"
      puts "2. Remove item"
      puts "3. Update item quantity"
      puts "4. View all items"
      puts "5. Search for an item"
      puts "6. Exit"
    end 
  
    def addItem
      puts "Enter the key : "
      key = gets.chomp
      puts "Enter the value :"
      value = gets.chomp.to_i
      if !@@hash.has_key?(key)
        @@hash[key] = value
        puts "Item added: #{key} -> #{value}"
      else
        puts "Item already exists."
      end
    end
  
    def removeItem
      puts "Enter the key to delete: "
      key = gets.chomp
      if @@hash.delete(key)
        puts "Item removed: #{key}"
      else
        puts "Item not found."
      end
    end
  
    def updateItem
      puts "Enter the Item name: "
      key = gets.chomp 
      if @@hash.has_key?(key)
        puts "Enter the updated value: "
        value = gets.chomp.to_i
        @@hash[key] = value
        puts "Item updated: #{key} -> #{value}"
      else
        puts "Item not present in the shop."
      end
    end
  
    def viewItem
      if @@hash.empty?
        puts "No items in the inventory."
      else
        puts "Current inventory:"
        @@hash.each do |key, value|
          puts "#{key} -> #{value}"
        end
      end
    end
  
    def searchItem
      puts "Enter the Item to search in the shop: "
      key = gets.chomp
      if @@ha
        @exit_symbol = true
         wrong_option = 0
  
      while sh.has_key?(key)
        puts "Item found: #{key} -> #{@@hash[key]}"
      else
        puts "Item not present in the shop."
      end
    end
  
    def showWarning(number)
      puts "Invalid option: #{number}. Please choose a valid option from the menu:"
      
    end
  end
  
  User1 = Inventory.new
  User2 = Inventory.new
  User1.viewItem
  User2.viewItem