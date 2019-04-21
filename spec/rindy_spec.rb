require "spec_helper"

describe "Rindy" do
  it "can create wallet" do
    wallet = IndyWallet.new("TST2")
    wallet.create
  end
end
