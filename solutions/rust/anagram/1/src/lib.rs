use std::collections::{HashSet, HashMap};

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let mut result = HashSet::new();
    let word = word.trim().to_lowercase();
    let word_length = word.len();
    
    // Create a frequency map for the word
    let mut word_char_map = HashMap::new();
    for c in word.chars() {
        *word_char_map.entry(c).or_insert(0) += 1;
    }
    
    for p in possible_anagrams {
        let p_str = p.trim().to_lowercase();
        
        if p_str.len() != word_length || word == p_str{
            continue;
        }
        
        // Create a frequency map for the current possible anagram
        let mut p_char_map = HashMap::new();
        for c in p_str.chars() {
            *p_char_map.entry(c).or_insert(0) += 1;
        }
        
        if word_char_map == p_char_map {
            result.insert(*p);
        }
    }
    
    result
}