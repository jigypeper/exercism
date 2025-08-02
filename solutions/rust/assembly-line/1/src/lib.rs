// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

pub fn production_rate_per_hour(speed: u8) -> f64 {
    
    if speed < 5 {
        (speed as i64 * 221) as f64
    } else if speed < 9 {
        ((speed as i64 * 221) as f64) * 0.9
    } else {
        ((speed as i64 * 221) as f64) * 0.77    
    }
        
    
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    production_rate_per_hour(speed) as u32 / 60
}
