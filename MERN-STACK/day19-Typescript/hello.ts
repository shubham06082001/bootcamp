import {Employee} from "./class"

let age: number = 5
let employee: string = "Shyam"

console.log("age is : " + age)
console.warn("employee is: " + employee)

let shape: Array<string> = ["circle", "square", "rectangle"]

function shapes() {
  return shape.splice(0, 4)
}
function hello(msg: string) {
  return "Hello World : " + msg
}

let sum = (a: number, b: number): number => {
  return a + b
}

console.log(sum(10, 20))

let emp: Employee = new Employee(1, "Ram", 12345);
