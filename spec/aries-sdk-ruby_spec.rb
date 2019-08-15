require "spec_helper"

describe "aries-sdk-ruby" do
  it "can create a wallet" do
    wallet = AriesWallet.new("WALLET1")
    wallet.create
    wallet.delete
  end
  it "cannot create a duplicate wallet" do
    wallet1 = AriesWallet.new("WALLET2")
    wallet1.create
    wallet2 = AriesWallet.new("WALLET2")
    expect{wallet2.create}.to raise_error(/Wallet with this name already exists/)
    wallet1.delete
  end
  it "can delete a wallet" do
    wallet = AriesWallet.new("WALLET3")
    wallet.create
    wallet.delete
  end
  it "can open and close a wallet" do
    wallet = AriesWallet.new("WALLET5")
    wallet.create
    wallet.open
    wallet.close
    wallet.delete
  end
  it "cannot delete a wallet twice" do
    wallet = AriesWallet.new("WALLET6")
    wallet.create
    wallet.delete
    expect{wallet.delete}.to raise_error(/No wallet database exists/)
  end

  it "can create a pool" do
    pool = AriesPool.new("POOL1")
    pool.create
    pool.delete
  end
  it "cannot create a duplicate pool" do
    pool1 = AriesPool.new("POOL2")
    pool1.create
    pool2 = AriesPool.new("POOL2")
    expect{pool2.create}.to raise_error(/Pool ledger config file with name/)
    pool1.delete
  end
  it "can delete a pool" do
    pool = AriesPool.new("POOL3")
    pool.create
    pool.delete
  end
  it "can open and close a pool" do
    pool = AriesPool.new("POOL5")
    pool.create
    pool.open
    pool.close
    pool.delete
  end
  it "cannot delete a pool twice" do
    pool = AriesPool.new("POOL6")
    pool.create
    pool.delete
    expect{pool.delete}.to raise_error(/No such file or directory/)
  end

  it "can create a DID" do
    wallet = AriesWallet.new("WALLET0")
    wallet.create
    wallet.open
    did = AriesDID.new("000000000000000000000000Steward1")
    did.create(wallet)
    wallet.close
    wallet.delete
  end
end
