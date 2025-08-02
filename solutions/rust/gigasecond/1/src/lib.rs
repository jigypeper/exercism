use time::PrimitiveDateTime as DateTime;

const BILL_SECONDS: i64 = 1_000_000_000;
// Returns a DateTime one billion seconds after start.
pub fn after(start: DateTime) -> DateTime {
    //unimplemented!("What time is a gigasecond later than {}", start);

    start + time::Duration::seconds(BILL_SECONDS)
}
