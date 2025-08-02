

#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(_first_list: &[T], _second_list: &[T]) -> Comparison {

    match (_first_list, _second_list) {
        (f, s) if f == s => Comparison::Equal,
        (_, []) => Comparison::Superlist,
        ([], _) => Comparison::Sublist,
        (f, s) if f.windows(s.len()).any(|x| x == s) => Comparison::Superlist,
        (f, s) if s.windows(f.len()).any(|x| x == f) => Comparison::Sublist,
        _ => Comparison::Unequal
    }

}
    
