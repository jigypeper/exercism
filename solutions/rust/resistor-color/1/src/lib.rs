use int_enum::IntEnum;
use enum_iterator::{all, Sequence};


#[derive(Debug, PartialEq, Eq, IntEnum, Copy, Clone, Sequence)]
#[repr(u32)]
pub enum ResistorColor {
    Black = 0,
    Blue = 6,
    Brown = 1,
    Green = 5,
    Grey = 8,
    Orange = 3,
    Red = 2,
    Violet = 7,
    White = 9,
    Yellow = 4,
}

pub fn color_to_value(_color: ResistorColor) -> u32 {
    _color.int_value()
}

pub fn value_to_color_string(value: u32) -> String {
    let _color: ResistorColor;
    match value {
        0 => String::from("Black"),
        1 => String::from("Brown"),
        2 => String::from("Red"),
        3 => String::from("Orange"),
        4 => String::from("Yellow"),
        5 => String::from("Green"),
        6 => String::from("Blue"),
        7 => String::from("Violet"),
        8 => String::from("Grey"),
        9 => String::from("White"),
        _ => String::from("value out of range")
    }
}

pub fn colors() -> Vec<ResistorColor> {
    let mut vector: Vec<ResistorColor> = all::<ResistorColor>().collect();
    vector.sort_by(|a, b| a.int_value().cmp(&b.int_value()));
    vector
}
