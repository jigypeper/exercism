pub fn reply(message: &str) -> &str {
    let trimmed = message.trim();

    if trimmed.is_empty() {
        return "Fine. Be that way!";
    }

    let is_question = trimmed.ends_with('?');
    let has_letters = trimmed.chars().any(|c| c.is_alphabetic());
    let all_letters_uppercase = trimmed.chars().all(|c| !c.is_alphabetic() || c.is_uppercase());
    let is_yelling = has_letters && all_letters_uppercase;

    match (is_question, is_yelling) {
        (true, true) => "Calm down, I know what I'm doing!",
        (true, false) => "Sure.",
        (false, true) => "Whoa, chill out!",
        (false, false) => "Whatever.",
    }
}
