#[macro_use]
extern crate helix;

extern crate indyrs as indy;

use indy::wallet;
use std::string::String;

use indy::future::Future;

ruby! {
    class IndyWallet {
        struct {
            name: String,
            handle: i32
        }

        def initialize(helix, name: String) {
            let handle = 0;
            IndyWallet { helix, name, handle }
        }

        def create(&self) {
            let config = format!("{{\"id\":\"wallet{}\"}}", self.name);
            let credentials = String::from("{\"key\":\"8dvfYSt5d1taSd6yJdpjq4emkwsPDDLYxkNFysFD2cZY\",\"key_derivation_method\":\"RAW\"}");

            wallet::create_wallet(&config, &credentials).wait().unwrap();
        }
        def open(&mut self) {
            let config = format!("{{\"id\":\"wallet{}\"}}", self.name);
            let credentials = String::from("{\"key\":\"8dvfYSt5d1taSd6yJdpjq4emkwsPDDLYxkNFysFD2cZY\",\"key_derivation_method\":\"RAW\"}");

            self.handle = wallet::open_wallet(&config, &credentials).wait().unwrap();
        }
        def close(&self) {
            wallet::close_wallet(self.handle).wait().unwrap();
        }
        def delete(&self) {
            let config = format!("{{\"id\":\"wallet{}\"}}", self.name);
            let credentials = String::from("{\"key\":\"8dvfYSt5d1taSd6yJdpjq4emkwsPDDLYxkNFysFD2cZY\",\"key_derivation_method\":\"RAW\"}");

            indy::wallet::delete_wallet(&config, &credentials).wait().unwrap();
        }
    }
    class IndyPool {
        def hello() {
            println!("Hello from IndyPool!");
        }
    }
}
