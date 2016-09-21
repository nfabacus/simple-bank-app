class Account

  def initialize(balance=0)
    @balance = balance.to_i
    @records =[]
  end

  def deposit (credit)
    @deposit_date = Time.now.strftime("%d/%m/%Y")
    @balance = @balance + credit.to_i
    @records << {:type => "credit", :date => @deposit_date, :amount => credit.to_i, :balance => @balance }
  end

  def withdraw (debit)
    @withdrawal_date = Time.now.strftime("%d/%m/%Y")
    @balance = @balance - debit.to_i
    @records << {:type => "debit", :date => @withdrawal_date, :amount => debit.to_i, :balance => @balance }
  end

  def print_statement
    @outputs = ""
    @records.each do |record|
      @output = record[:date].to_s + " " + record[:type].to_s + ": " + record[:amount].to_s + ", balance: " + record[:balance].to_s
      puts @output
      @outputs += @output
    end
      @outputs
  end

  def records
    @records
  end

end
