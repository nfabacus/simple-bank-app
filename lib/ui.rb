require_relative 'account'

your_account = Account.new
puts "Welcome to Noby's Bank"
choice = ""

while choice != "leave"
  puts "What would you like to do? deposit, withdraw, check balance? or leave"
  choice = gets.chomp

  case choice
  when "leave"
    break
  when "deposit"
    puts "How much would you like to deposit?"
    deposit_amount = gets.chomp.to_i
    your_account.deposit(deposit_amount)
  when "withdraw"
    puts "How much would you like to withdraw?"
    debit_amount = gets.chomp.to_i
    your_account.withdraw(debit_amount)
  when "check balance"
    puts "Below is your balance:"
    your_account.print_statement
  end
end
