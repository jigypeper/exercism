#[derive(Debug, PartialEq)]
pub struct Clock {
    minutes: i32,
}

const MINUTES_DAY: i32 = 1440;

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        
        Self {
            minutes: ((((hours * 60) + minutes) % MINUTES_DAY) + MINUTES_DAY) % MINUTES_DAY
        }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        
        Self {
            minutes: (((self.minutes + minutes) % MINUTES_DAY) + MINUTES_DAY) % MINUTES_DAY
        }
    }

    pub fn to_string(&self) -> String {
        let mut hours = self.minutes / 60;
        let mut minutes = self.minutes % 60;
        let mut string_rep: String = String::new();

        if &hours.to_string().chars().count() < &2 && &minutes.to_string().chars().count() < &2 {
            string_rep = format!("0{}:0{}", hours.abs(), minutes.abs());
        } else if &hours.to_string().chars().count() < &2 {
            string_rep = format!("0{}:{}", hours.abs(), minutes.abs());
        } else if &minutes.to_string().chars().count() < &2 {
            string_rep = format!("{}:0{}", hours.abs(), minutes.abs());
        } else {
            string_rep = format!("{}:{}", hours.abs(), minutes.abs());
        }
        string_rep
    }
}
