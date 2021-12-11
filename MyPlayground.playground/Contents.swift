struct Fibonacci {
    var array: Array<Int>
    
    init(_ n: Int) {
        self.array = Array(repeating: 0, count: n + 10)
    }
    
    mutating func getFibonacci(_ n: Int) -> Int {
        self.array[0] = 0
        self.array[1] = 1
        
        if n >= 2 {
            for i in 2...n {
                self.array[i] = self.array[i - 2] + self.array[i - 1]
            }
        }
        
        return self.array[n]
    }
}

let n: Int = Int(readLine()!)!
var fibonacci: Fibonacci = Fibonacci(n)

print(fibonacci.getFibonacci(n))
