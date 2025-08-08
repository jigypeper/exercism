pub fn is_armstrong_number(num: u32) -> bool {
    let exp: u32 = num.checked_ilog10().unwrap_or(0) + 1;
    let digits: Vec<u32> = num.to_string()
        .chars()
        .map(|c| c.to_digit(10).unwrap() as u32)
        .collect();
    num == digits.into_iter().map(|d| d.pow(exp)).sum()
}
