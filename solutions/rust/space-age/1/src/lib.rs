// The code below is a stub. Just enough to satisfy the compiler.
// In order to pass the tests you can add-to or change any of this code.

const EARTH_YEAR: f64 = 31_557_600.0;

#[derive(Debug)]
pub struct Duration {
    seconds: f64
}

impl From<u64> for Duration {
    fn from(s: u64) -> Self {
        Self {
            seconds: s as f64
        }
    }
}

pub trait Planet {
    fn years_during(d: &Duration) -> f64;
}

pub struct Mercury;
pub struct Venus;
pub struct Earth;
pub struct Mars;
pub struct Jupiter;
pub struct Saturn;
pub struct Uranus;
pub struct Neptune;

impl Planet for Mercury {
    fn years_during(d: &Duration) -> f64 {
        let diff: f64 = 0.2408467;
        (d.seconds / EARTH_YEAR) / diff
    }
}
impl Planet for Venus {
    fn years_during(d: &Duration) -> f64 {
        let diff: f64 = 0.61519726;
        (d.seconds / EARTH_YEAR) / diff
    }
}
impl Planet for Earth {
    fn years_during(d: &Duration) -> f64 {
        let diff: f64 = 1.0;
        (d.seconds / EARTH_YEAR) / diff
    }
}
impl Planet for Mars {
    fn years_during(d: &Duration) -> f64 {
        let diff: f64 = 1.8808158;
        (d.seconds / EARTH_YEAR) / diff
    }
}
impl Planet for Jupiter {
    fn years_during(d: &Duration) -> f64 {
        let diff: f64 = 11.862615;
        (d.seconds / EARTH_YEAR) / diff
    }
}
impl Planet for Saturn {
    fn years_during(d: &Duration) -> f64 {
        let diff: f64 = 29.447498;
        (d.seconds / EARTH_YEAR) / diff
    }
}
impl Planet for Uranus {
    fn years_during(d: &Duration) -> f64 {
        let diff: f64 = 84.016846;
        (d.seconds / EARTH_YEAR) / diff
    }
}
impl Planet for Neptune {
    fn years_during(d: &Duration) -> f64 {
        let diff: f64 = 164.79132;
        (d.seconds / EARTH_YEAR) / diff
    }
}
