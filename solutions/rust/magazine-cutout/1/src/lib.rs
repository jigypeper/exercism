// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

use std::collections::HashMap;

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    //unimplemented!()
    let mut test_hash =  HashMap::new();

    for word in magazine {
        *test_hash.entry(word).or_insert(0) += 1;
    }

    for word in note {
        *test_hash.entry(word).or_insert(0) -= 1;
    }
    test_hash.values().all(|&x| x >= 0)
}

