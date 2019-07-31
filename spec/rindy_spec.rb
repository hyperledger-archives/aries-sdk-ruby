require "spec_helper"

describe "Rindy" do
  it "can create a wallet" do
    wallet = IndyWallet.new("WALLET1")
    wallet.create
  end
  it "cannot create a duplicate wallet" do
    wallet1 = IndyWallet.new("WALLET2")
    wallet1.create
    wallet2 = IndyWallet.new("WALLET2")
    expect{wallet2.create}.to raise_error(/Wallet with this name already exists/)
  end
  it "can delete a wallet" do
    wallet = IndyWallet.new("WALLET3")
    wallet.create
    wallet.delete
  end
  it "can open a wallet" do
    wallet = IndyWallet.new("WALLET4")
    wallet.create
    wallet.open
  end
  it "can open and close a wallet" do
    wallet = IndyWallet.new("WALLET5")
    wallet.create
    wallet.open
    wallet.close
  end
  it "cannot delete a wallet twice" do
    wallet = IndyWallet.new("WALLET6")
    wallet.create
    wallet.delete
    expect{wallet.delete}.to raise_error(/No wallet database exists/)
  end

  it "can create a pool" do
    pool = IndyPool.new("POOL1")
    pool.create
  end
  it "cannot create a duplicate pool" do
    pool1 = IndyPool.new("POOL2")
    pool1.create
    pool2 = IndyPool.new("POOL2")
    expect{pool2.create}.to raise_error(/Pool ledger config file with name/)
  end
  it "can delete a pool" do
    pool = IndyPool.new("POOL3")
    pool.create
    pool.delete
  end
  it "can open a pool" do
    pool = IndyPool.new("POOL4")
    pool.create
    pool.open
  end
  it "can open and close a pool" do
    pool = IndyPool.new("POOL5")
    pool.create
    pool.open
    pool.close
  end
  it "cannot delete a pool twice" do
    pool = IndyPool.new("POOL6")
    pool.create
    pool.delete
    expect{pool.delete}.to raise_error(/No such file or directory/)
  end
end
