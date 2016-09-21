require 'account'

describe Account do

  it 'allows deposit' do
    account = Account.new
    account.deposit(100)
    record = account.records[0]
    expect(record[:amount]).to eq 100
  end

  it 'records date when a deposit is made' do
    account = Account.new
    account.deposit(100)
    record = account.records[0]
    expect(record[:date]).to eq Time.now.strftime("%d/%m/%Y")
  end

  it 'records balance when a deposit is made' do
    account = Account.new
    account.deposit(100)
    account.deposit(50)
    record = account.records[1]
    expect(record[:balance]).to eq 150
  end

  it 'allows withdrawal' do
    account = Account.new
    account.deposit(100)
    account.withdraw(10)
    record = account.records[1]
    expect(record[:balance]).to eq 90
  end

  it 'prints statement' do
    account = Account.new
    account.deposit(200)
    account.deposit(800)
    account.withdraw(100)
    expect(account.print_statement).to eq '21/09/2016 credit: 200, balance: 20021/09/2016 credit: 800, balance: 100021/09/2016 debit: 100, balance: 900'
  end

end
