#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
 //    unimplemented!(
	// 	"Given the inputs: {:?}, evaluate them as though they were a Reverse Polish notation expression",
	// 	inputs,
	// );

    if inputs.len() == 0 {
        return None;
    }

    let mut stack = Vec::new();

    for element in inputs {
        match element {
            CalculatorInput::Value(x) => stack.push(*x),
            _ => {
                if stack.len() < 2 {
                    return None;
                }
                
                match element {
                    CalculatorInput::Add => {
                        let value_2 = stack.pop().unwrap();
                        let value_1 = stack.pop().unwrap();
                        stack.push(value_1 + value_2)
                    },
                    CalculatorInput::Subtract => {
                        let value_2 = stack.pop().unwrap();
                        let value_1 = stack.pop().unwrap();
                        stack.push(value_1 - value_2)
                    },
                    CalculatorInput::Multiply => {
                        let value_2 = stack.pop().unwrap();
                        let value_1 = stack.pop().unwrap();
                        stack.push(value_1 * value_2)
                    },
                    CalculatorInput::Divide => {
                        let value_2 = stack.pop().unwrap();
                        let value_1 = stack.pop().unwrap();
                        stack.push(value_1 / value_2)
                    },
                    _ => return None,
            
                }
            }
            
        }
    }

    if stack.len() != 1 {
        return None;
    }

    stack.pop()
}
