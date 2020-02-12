require "spec_helper"

describe "aries-sdk-ruby" do
  it "can create a wallet" do
    wallet = AriesWallet.new("WALLET1")
    wallet.create
    wallet.delete
  end

  it "can find an existing wallet" do
    wallet = AriesWallet.new("WALLETX")
    wallet.create
    wallet.open
    wallet.close
    new_wallet = AriesWallet.new("WALLETX")
    # no create needed here
    new_wallet.open
    new_wallet.close
    new_wallet.delete
  end

  it "cannot find a non-existent wallet" do
    wallet = AriesWallet.new("NOSUCHWALLET")
    # no create needed here
    expect{wallet.open}.to raise_error(/Wallet not found/)
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

  it "can open an existing pool" do
    pool = AriesPool.new("POOLX")
    pool.create
    new_pool = AriesPool.new("POOLX")
    new_pool.open
    new_pool.close
    new_pool.delete
  end

  it "cannot open a non-existent pool" do
    pool = AriesPool.new("NOSUCHPOOL")
    expect{pool.open}.to raise_error(/Pool is not created for name/)
  end

  it "cannot delete a pool twice" do
    pool = AriesPool.new("POOL6")
    pool.create
    pool.delete
    expect{pool.delete}.to raise_error(/No such file or directory/)
  end

  it "can create a Steward DID" do
    wallet = AriesWallet.new("WALLET0")
    wallet.create
    wallet.open
    did = AriesDID.new()
    seed = AriesJson.to_string('{"seed":"000000000000000000000000Steward1"}')
    did.create(wallet,seed)
    wallet.close
    wallet.delete
  end

  it "can create a Trust Anchor DID" do
    wallet = AriesWallet.new("WALLET0")
    wallet.create
    wallet.open
    did = AriesDID.new()
    did.create(wallet,"{}")
    wallet.close
    wallet.delete
  end

  it "can create a NYM" do
    steward_wallet = AriesWallet.new("WALLET_STEWARD")
    steward_wallet.create
    steward_wallet.open
    steward_did = AriesDID.new()
    seed = AriesJson.to_string('{"seed":"000000000000000000000000Steward1"}')
    steward_did.create(steward_wallet,seed)

    trustee_wallet = AriesWallet.new("WALLET_TRUSTEE")
    trustee_wallet.create
    trustee_wallet.open
    trustee_did = AriesDID.new()
    trustee_did.create(trustee_wallet,"{}")

    nym = AriesDID.build_nym(steward_did,trustee_did)

    trustee_wallet.close
    trustee_wallet.delete

    steward_wallet.close
    steward_wallet.delete
  end

  it "can create a schema" do
    steward_wallet = AriesWallet.new("WALLET_STEWARD")
    steward_wallet.create
    steward_wallet.open
    steward_did = AriesDID.new()
    seed = AriesJson.to_string('{"seed":"000000000000000000000000Steward1"}')
    steward_did.create(steward_wallet,seed)

    cred = AriesCredential.new()
    cred.issuer_create_schema(steward_did,"gvt","1.0",'["age","sex","height","name"]')

    steward_wallet.close
    steward_wallet.delete
  end

  it "can fetch key for DID" do
    pool = AriesPool.new("POOLX1")
    pool.create
    pool.open

    wallet = AriesWallet.new("WALLET_STEWARD")
    wallet.create
    wallet.open
    steward_did = AriesDID.new()
    seed = AriesJson.to_string('{"seed":"000000000000000000000000Steward1"}')
    steward_did.create(wallet,seed)

    trustee_did = AriesDID.new()
    trustee_did.create(wallet,"{}")
#    puts trustee_did.get_verkey

    otherWallet = AriesWallet.new("WALLETX1")
    otherWallet.create
    otherWallet.open

    nym = AriesDID.build_nym(steward_did,trustee_did)
#    puts nym
    ssresult = steward_did.sign_and_submit_request(pool,wallet,nym)
#    puts ssresult

    verkey = pool.key_for_did(otherWallet,trustee_did)
    expect(verkey).to eq(trustee_did.get_verkey)

    wallet.close
    wallet.delete

    otherWallet.close
    otherWallet.delete

    pool.close
    pool.delete
  end

  it "cannot fetch key for DID" do
    pool = AriesPool.new("POOLX1")
    pool.create
    pool.open

    wallet = AriesWallet.new("WALLET_STEWARD")
    wallet.create
    wallet.open
    steward_did = AriesDID.new()
    seed = AriesJson.to_string('{"seed":"000000000000000000000000Steward1"}')
    steward_did.create(wallet,seed)

    trustee_did = AriesDID.new()
    trustee_did.create(wallet,"{}")
#    puts trustee_did.get_verkey

    otherWallet = AriesWallet.new("WALLETX1")
    otherWallet.create
    otherWallet.open

    nym = AriesDID.build_nym(steward_did,trustee_did)
#    puts nym

#    forget to sign and submit on the ledger here on purpose

    expect{pool.key_for_did(otherWallet,trustee_did)}.to raise_error(/Wallet item not found/)

    wallet.close
    wallet.delete

    otherWallet.close
    otherWallet.delete

    pool.close
    pool.delete
  end
end
