pub fn collatz(n: u64) -> Option<u64> {
    if n == 0 {
            return None;
    }

    if n == 1 {
            return Some(0);
    }
    
    let mut steps = 0;
    let mut n = n;
    loop {
        if n == 1 {
            return Some(steps);
        }

        if n % 2 == 0 {
            steps += 1;
            n = n / 2;
        } else {
            steps += 1;
            n = (3 * n) + 1;
        }
    }
}
