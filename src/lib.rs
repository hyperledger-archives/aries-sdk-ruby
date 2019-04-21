#[macro_use]
extern crate helix;

extern crate indyrs as indy;

use indy::wallet;
use std::string::String;

use indy::future::Future;

ruby! {
    class IndyWallet {
        struct {
            name: String
        }

        def initialize(helix, name: String) {
            IndyWallet { helix, name }
        }

        def create(&self) {
            let config = format!("{{\"id\":\"wallet{}\"}}", self.name);
            let credentials = String::from("{\"key\":\"8dvfYSt5d1taSd6yJdpjq4emkwsPDDLYxkNFysFD2cZY\",\"key_derivation_method\":\"RAW\"}");

            wallet::create_wallet(&config, &credentials).wait().unwrap();
        }
        def open(&self) {

        }
    }
    class IndyPool {
        def hello() {
            println!("Hello from IndyPool!");
        }
    }
}
