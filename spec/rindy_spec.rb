require "spec_helper"

describe "Rindy" do
  it "can create a wallet" do
    wallet = IndyWallet.new("TST1")
    wallet.create
  end
  it "cannot create a duplicate wallet" do
    wallet1 = IndyWallet.new("TST2")
    wallet1.create
    wallet2 = IndyWallet.new("TST2")
    expect{wallet2.create}.to raise_error(/Wallet with this name already exists/)
  end
  it "can delete a wallet" do
    wallet = IndyWallet.new("TST3")
    wallet.create
    wallet.delete
  end
  it "can open a wallet" do
    wallet = IndyWallet.new("TST4")
    wallet.create
    wallet.open
  end
  it "can open and close a wallet" do
    wallet = IndyWallet.new("TST5")
    wallet.create
    wallet.open
    wallet.close
  end
  it "cannot delete a wallet twice" do
    wallet = IndyWallet.new("TST6")
    wallet.create
    wallet.delete
    expect{wallet.delete}.to raise_error(/No wallet database exists/)
  end
end
