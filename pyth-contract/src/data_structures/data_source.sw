library;

use std::hash::{Hash, Hasher};

pub struct DataSource {
    chain_id: u16,
    emitter_address: b256,
}

impl Hash for DataSource {
    fn hash(self, ref mut state: Hasher) {
        self.chain_id.hash(state);
        self.emitter_address.hash(state);
    }
}

impl DataSource {
    pub fn new(chain_id: u16, emitter_address: b256) -> Self {
        Self {
            chain_id,
            emitter_address,
        }
    }

    #[storage(read)]
    pub fn is_valid(
        self,
        is_valid_data_source: StorageKey<StorageMap<DataSource, bool>>,
) -> bool {
        match is_valid_data_source.get(self).try_read() {
            Some(bool) => bool,
            None => false,
        }
    }
}
