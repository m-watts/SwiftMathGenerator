# SwiftMathGenerator

A small library for generating math problems in swift. The library features an object model for representing math problems and a set of generators for generating math problems. 


## Features
* Object model for representing math problems
* A set of generators that can be controlled with through configuration
* A string formatter for displaying the math problem
* A LaTeX formatter for producing valid LaTeX equation strings that can be interpreted by fx. KaTeX.

## Installation
SwiftMathGenerator is available through the Swift Package Manager.

## Usage

### Example: SimpleMathGenerator

The example belows shows how to generate a set of simple math problems using the SimpleMathGenerator. 

it will generate a set of 10 problems with an even chance of the problems including addition, subtraction, multiplication and division. Each problem will contain between 1 and 4 elements.

```
let generator : MathGenerator = SimpleMathGenerator()
let operations : [(operation: MathOperation, weight: Int)] = [(.addition, 1), (.subtraction, 1), (.multiplication, 1), (.division, 1)]
let config = MathConfig.init(
    problemAmount: 10,
    allowedOperations: operations,
    allowDecimals: false,
    digitsAfterDecimal: 0,
    numElementsLower: 1,
    numElementsUpper: 4)



let problems = generator.generateProblems(config: config)

for problem in problems {
    print("========================")
    print("\(problem) = \(problem.result)" )
}
```

## Author
SwiftMathGenerator was createdd by Martin Watts, a Senior Lead iOS engineer at CRi Solutions. CRi is a leader in developing cutting edge iOS, Android, and mobile web applications and solutions for our corporate and financial clients.

Email: mlong@clientresourcesinc.com
Twitter: @hmlco

## License 

SwiftMathGenerator is available under the MIT license. See the LICENSE file for more info.



