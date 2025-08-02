pub fn reverse(input: &str) -> String {
    //unimplemented!("Write a function to reverse {}", input);
    let chars: Vec<String> = input.chars().map(|x| x.to_string()).collect();
    let mut rev_string = String::new();
    let n = chars.len();
    
    for i in 0..n  {
        rev_string += chars[n - 1-i].as_str();
    }
    rev_string
}
