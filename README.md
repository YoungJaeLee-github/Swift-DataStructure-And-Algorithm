# Swift Data Structure And Algorithm

## I. Swift Language Coding Interview 관련 기본 Tip

### 1. 기본 입력(Input)/출력(Output)
<pre>
1. Swift에서 기본 입력은 readLine(), 즉 줄단위 String 형태로 입력을 받음
2. 따라서 상황에 맞게 Optional unwrapping, Optional Chaining, nil 병합 연산자 등을 적절히 사용하여 Casting 해주어야 함
3. print() 함수 사용시, 기본으로 "\n"개행 문자가 추가됨
</pre>

#### 1.1. 정수 자료형을 입력 받아야 하는 경우

```swift
if let number = Int(readLine() ?? "0") { }
```

#### 1.2. 함수 안에서 정수 자료형을 입력 받아야 하는 경우

```swift
guard let input: Int = Int(readLine() ?? "0") else { return }
```

#### 1.3. print() 사용시, 줄바꿈 없이("\n") 출력해야 하는 경우

```swift
print(data, terminator: "")
```

#### 1.4. 배열의 원소를 공백을 두고 줄바꿈 없이 출력해야 하는 경우 -> "\() " 문자열 보간법 사용

```swift
for number in array { 
    print("\(number) ", terminator: "")
}
```

### 2. Swift의 N x M 크기의 2차원 배열 생성 방법

```swift
let array: [[Int]] = Array(repeating: Array(repeating: 0, count: M), count: N)
```

### 3. Swift의 for 반복문 거꾸로 / 혹은 원하는 범위내에 원하는 만큼 증감하면서 순회하는 방법
#### 3.1. 마지막 순서를 포함하지 않는 경우

```swift
for i in stride(from: 5, to: 0, by: -1) {
    print("\(i) ", terminator: "")  // 5 4 3 2 1 
}
```

#### 3.2. 마지막 순서를 포함하는 경우

```swift
for i in stride(from: 5, through: 0, by: -1) {
    print("\(i) ", terminator: "")  // 5 4 3 2 1 0
}
```

#### 3.3. for i in 1...N 사용시, 시작 범위보다 끝 범위가 작을 경우 Error 방지(원하는 범위내에 원하는 만큼 증감)

```swift
for i in stride(from: 1, through: N, by: 1) {
    // code
}
```

### 4. Swift String(문자열)내 각 Character(문자) 접근 방법
#### 4.1. 단순히 for 반복문을 이용

```swift
for char in str { 
    print(char) 
}
```

#### 4.2. index가 필요한 경우

```swift
for i in 0..<str.count { 
    print(str[str.index(str.startIndex, offsetBy: i)]) 
}
```

### 5. Swift Character Ascii code 연산
<pre>
1. Swift의 Character는 struct으로 구현되어 있고, 그 내부에 연산 프로퍼티로 asciiValue가 존재함
2. 위 asciiValue 연산 프로퍼티는 UInt8 자료형, 따라서 character.asciiValue를 하게 되면, Optional 형태의 Ascii code 값을 얻을 수 있음
3. 반대로 asciiValue를 통해 Character로 변환하려면 Casting을 해주어야 하는데 이때, UnicodeScalar를 통해 Character로 Casting 할 수 있음
</pre>

#### 5.1. Swift Character -> Ascii code(UInt8)

```swift
let alpha: Character = "A"
let ascii: UInt8 = alpha.asciiValue ?? 0
    
print(ascii)    // 65
```

#### 5.2. Swift Ascii code(UInt8) -> Character

```swift
let alpha: Character = "a"
let ascii: UInt8 = alpha.asciiValue ?? 0
let asciiToAlpha: Character = Character(UnicodeScalar(ascii - 32))
    
print(asciiToAlpha) // A
```

<hr>
</hr>

</br>

## II. Swift를 활용한 Data Structure와 Algorithm의 개념 및 예제 정리

### 1. 컴퓨터를 공부하면서 반드시 숙지해야 할 것
<pre>
1. 문제 해결이 목적, 컴퓨터 프로그래밍은 그 수단
2. 문제해결은 컴퓨터라는 연산 장치로 사람이 빠르게 할 수 없는 연산 같은 것을 컴퓨터로 효율적이게 처리하는 것을 예로 들 수 있음
3. 프로그래밍 언어란, 사람이 컴퓨터와 소통하기 위한 언어로, 각각의 목적에 따라 여러 종류의 언어가 존재
</pre>

### 2. 프로그램의 실행 단계
<pre>
1. 인간이 이해할 수 있는 고급 프로그래밍 언어 => 컴파일러 => 어셈블리어 => Binary(0101...) => 프로그램 실행
</pre>

### 3. 변수와 자료형
<pre>
1. 변수 : 컴퓨터에 데이터를 저장할 공간
2. 자료형 : 컴퓨터에 저장할 데이터의 형태 : 정수/실수, 문자, 문자열 등
3. 정수형 변수의 범위 : -21억 ~ 21억(-2^31 ~ 2^31 - 1)
</pre>

### 4. 캐스팅의 개념
<pre>
1. 같은 자료형 사이의 연산은 그 자료형 연산으로 취급
2. 다른 자료형 사이의 연산은 더 큰 범위의 연산으로 취급
3. 즉, 자료형을 임시로 바꾸는 것을 캐스팅이라고 함
</pre>

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Basic%20Input%26Output">=> 기본 입출력 예제</a></pre>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Basic%20Conditional">=> 기본 조건문 예제</a></pre>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Basic%20Loop">=> 기본 반복문 예제</a></pre>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Multiple%20Loops">=> 다중 반복문 예제</a></pre>

<hr>
</hr>

### 5. 문제를 해결하기 전에 해야할 것
<pre>
1. 해당 문제에 맞는 설계 후 프로그래밍을 진행해야 정확하고 실수없이 해결할 수 있음
</pre>

### 6. 배열
<pre>
1. 변수 여러개를 한 번에 선언할 수 있는 방법
2. 장점 : 데이터에 대한 접근이 빠름, 변수를 일일히 선언하지 않아도 동일한 자료형의 변수를 여러개를 한 번에 저장할 수 있음
3. 단점 : 데이터에 대한 삽입/삭제 연산이 느림, 정적인 크기 할당
</pre>

### 7. 2차원 배열
<pre>
1. 2차원 좌표평면과 유사
2. 가로, 세로가 존재함
</pre>

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Array">=> 배열 예제</a></pre>

<hr>
</hr>

### 8. 완전 탐색에 대한 이해(Brute-Force Algorithm)
<pre>
1. 문제 해결하는 방법이 여러가지가 있고, 흔히 사용하는 방법이 몇 가지가 존재함
2. 그 중 가장 간단한 문제 해결 방법이 완전 탐색
3. 가능한 모든 경우를 모두 시도해 보는 알고리즘
4. 완전 탐색을 수행하기 위해서는 모든 경우가 무엇인지 파악하는 것이 중요함
5. 문제를 접했을 때 가장 먼저 접근해봐야 하는 알고리즘 
</pre>

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Brute-Force%20Algorithm">=> 완전 탐색 알고리즘 예제</a></pre>

<hr>
</hr>

### 9. 정렬(Sort)
<pre>
1. 특정 기준을 적용하여 데이터를 나열하는 알고리즘
2. 오름차순 정렬(갈수록 커지는 것)
3. 내림차순 정렬(갈수록 작아지는 것)
</pre>

### 9.1 기본적인 정렬 알고리즘의 종류
#### 9.1.1. 선택정렬(Selection Sort)

<pre>
1. 최솟값을 맨 앞으로 이동시킴(오름차순)
2. 왼쪽은 정렬이 모두 되었다는 의미
3. O(N^2)의 시간복잡도를 가짐
</pre>

```swift
for i in 0...N - 1 {
    var index: Int = i
    for j in (i + 1)...N {
        if data[index] > data[j] {
            index = j
        }
    }
        
    let temp: Int = data[index]
    data[index] = data[i]
    data[i] = temp
}
```

#### 9.1.2. 삽입정렬(Insertion Sort)
<pre>
1. 원소를 차례대로 정렬된 배열에 삽입시킴
2. 왼쪽은 정렬이 모두 되었다는 의미
3. O(N^2)의 시간복잡도를 가짐
</pre>
    
```swift    
for i in 1...(N - 1) {
    for j in stride(from: i, to: 0, by: -1) {
        if data[j] < data[j - 1] {
            let temp: Int = data[j]
            data[j] = data[j - 1]
            data[j - 1] = temp
        }
    }
}
```

#### 9.1.3. 버블정렬(Bubble Sort)
<pre>
1. 인접한 원소를 비교하여 큰 수를 뒤로 보냄
2. 오른쪽은 정렬이 모두 되었다는 의미
3. O(N^2)의 시간복잡도를 가짐
</pre>

```swift 
for i in stride(from: N - 1, to: 0, by: - 1) {
    for j in 0...(i - 1) {
        if data[j] > data[j + 1] {
            let temp: Int = data[j]
            data[j] = data[j + 1]
            data[j + 1] = temp
        }
    }
}
```

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Sort%20Algorithm">=> 정렬 알고리즘 예제</a></pre>

<hr>
</hr>

### 10. 시간 복잡도(Time Complexity)
<pre>
1. 문제를 효율적으로 해결
2. 똑같은 문제를 해결 하더라도 빠르게 해결하는 것이 중요
3. 시간 복잡도를 계산 함으로써 프로그램을 직접 실행해보지 않더라도 얼마나 빠른지 대략적으로 알 수 있음
4. O(1), O(N), O(N^2) ... 중 가장 영향력 있는 시간복잡도가 최악의 경우 시간 복잡도를 결정함(최고차항)
5. 컴퓨터 사양마다 명령을 수행하는데 걸리는 시간은 다 다르지만 비슷하다고 가정 했을 때, 대략 1억번 연산을 수행하는데 1초가 걸림
</pre>

### 11. 기본 정수론(Basic Number Theory)
<pre>
1. 정수(Integer)의 성질을 연구하는 분야
2. 가령, 약수와 배수
</pre>

### 11.1. 약수(Divisor)
<pre>
특정 정수를 나누어 떨어지게 하는 수
</pre>

### 11.2. 소수(Prime Number)
<pre>
약수가 1과 자기 자신 뿐인 정수
</pre>

### 11.3. 에라토스테네스의 체
<pre>
1. 소수를 구하는 알고리즘 중 하나
2. 소수의 배수를 지워 나감으로써 2부터 특정 범위 내의 소수를 얻을 수 있음
3. O(N log N)의 시간복잡도를 가짐
4. 2부터 N까지 모든 숫자들 중 모든 소수를 구할 때 사용하면 빠르지만, 특정 수가 소수인지 아닌지 판별할 때는 제곱근 까지 나눠보는 것이 더 빠름 
</pre>

### 11.4. 소인수 분해
<pre>
1. 숫자 N을 소수의 곱으로 나타냄
2. 2부터 시작해서 차례대로 전부 나누어봄(2로 나누어 지는 수는 이미 앞에서 나눌 수 있을 때 까지 다 나누었기 때문에 4로 나누어지지 않는 것이 가능함, 3과 6, 5와 10 마찬가지)
</pre>

### 11.5. 유클리드 호제법
<pre>
1. 공약수 : A의 약수 이면서 동시에 B의 약수인 수
2. 공배수 : A의 배수 이면서 동시에 B의 배수인 수
3. 최대공약수(GCD, Greatest Common Divisor) : A의 약수 이면서 동시에 B의 약수인 수 중 가장 큰 수
4. 최소공배수(LCM, Least Common Multiple) : A의 배수 이면서 동시에 B의 배수인 수 중 가장 작은 수
5. 유클리드 호제법 : 최대공약수를 구하기 위한 알고리즘
</pre>

```swift
func getGCD(_ a: Int, _ b: Int) -> Int {
    return a % b == 0 ? b : getGCD(b, a % b)
}
```

### 11.6. 파스칼 삼각형
<pre>
1. 왼쪽 오른쪽 각 대각선 위의 수를 합하여 자신을 결정하는 형태
2. 조합과 관련이 있음
3. 경우의 수 문제에서 숫자가 굉장히 큰 경우 활용할 수 있음. 가령, 20 C 10의 끝 3자리 수를 구하는 경우(파스칼 삼각형을 구성할 때, % 1000 연산 하면 됨)
</pre>

```swift    
func getPascalTriangle() -> Void {
    let N: Int
    var pascal: [[Int]] = [N + 10][N + 10]
    pascal[0][0] = 1
        
    for i in 1...N {
        pascal[i][0] = 1
        pascal[i][i] = 1
            
        for j in 1...(i - 1) {
            pascal[i][j] = pascal[i - 1][j - 1] + pascal[i - 1][j]
        }
    }
}
```

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Basic%20Number%20Theory">=> 기본 정수론 예제</a></pre>

<hr>
</hr>

### 12. 문자형 변수(Character)
<pre>
오직 하나의 문자만 담을 수 있는 자료형
</pre>

### 13. 아스키 코드(Ascii Code)
<pre>
1. 컴퓨터는 문자를 모르기 때문에 숫자로 인식함
2. 출력할 때만 그 숫자에 대응되는 문자로 출력함
3. 숫자에 대응되는 문자 정보가 담긴 표를 아스키코드 표라고 함
</pre>

### 14. 문자열(String)
<pre>
1. 문자만으로 이루어진 배열
2. 여러 개의 문자를 저장할 수 있음
</pre>

### 15. 함수(Function)
<pre>
1. 수학에서 어떤 숫자가 들어왔을 때 처리를 해서 출력하는 것
2. 값을 입력받아 특정 연산을 수행하여 결과를 반환하는 것
</pre>

#### 15.1. Swift 함수 문법

```swift
func 함수이름 -> 반환타입 {
    구현체
    반환값
}
```
    
#### 15.2. Java 함수(메소드) 문법

```java
public (static) 반환타입 함수이름 {
    구현체
    반환값
}
```

### 16. 스코프(Scope)
<pre>
1. 변수는 선언된 블록 내에서만 접근할 수 있음
2. 함수간 작업의 완벽한 분담을 위해 스코프가 존재함
</pre>

### 17. 포인터(Pointer)
<pre>
1. 값을 저장하는 것이 아닌, 값의 위치(메모리 주소)를 저장하는 변수
2. 해당 주소가 가리키는 곳으로 접근하면 실제 저장되어 있는 값을 알 수 있음
3. 작성한 코드가 컴퓨터 내부적으로 어떻게 동작하는지에 대한 원리는 반드시 파악하고 있어야 하기 때문에 포인터의 개념이 중요함
</pre>

### 18. 메모리(Memory)
<pre>
1. 자료의 저장단위 : 비트(Bit), 바이트(Byte), 킬로바이트(KB), 메가바이트(MB), 기가바이트(GB)...
2. RAM(Random Access Memory) : 자료를 저장하기 위한 장치, 위치마다 접근하는데 걸리는 시간이 비슷하기 때문에 Random이라고 함
3. PC의 운영체제가 우리가 흔히 알고 있는 64bit 운영체제, 32bit 운영체제라는 것은 메모리 하나의 주소의 크기가 64bit, 32bit라는 것
4. 즉, 메모리의 주소 하나가 최대로 담을 수 있는 용량이 8Byte(64bit), 4Byte(32bit)라는 말과 동일함
5. Big Endian, Little Endian : 컴퓨터가 값을 저장하는 순서, 높은 숫자 부터 저장하는 것이 Big Endian, 낮은 숫자부터 저장하는 것이 Little Endian
</pre>

### 19. 운영체제(Operating System)
<pre>
1. 정의 : 하드웨어를 제어하기 위한 소프트웨어(ex) Linux, MacOS, Windows, iOS, Android...)
</pre>

### 20. Call By Value vs Call By Reference
<pre>
1. call by value : 값에 의한 호출, 변수의 값을 복사해서 인자로 넘겨줌. 따라서 원본의 값이 변경되지 않음
2. call by reference: 참조에 의한 호출, 변수의 주소를 인자로 넘겨줌. 따라서 원본의 값이 변경됨
</pre>

#### 20.1. Swift에서의 Array

<img width="490" alt="스크린샷 2022-03-12 16 16 04" src="https://user-images.githubusercontent.com/77099686/158008204-caa533b8-d10c-4e71-a0f3-dd3ca6fe67fb.png">
    
<pre>
1. Swift에서 Array는 struct 즉, 값 타입이기 때문에 전달인자로 전달될 때 값이 복사돼서 넘어감
2. Call By Value를 Call By Reference 처럼 사용할 수 있는 방법이 있지만, 권장하지 않음
3. 단, 아래와 같이 정확한 목적이 있는 경우에는 inout 키워드와 &(주소)값을 넘김으로써 사용할 수도 있음
</pre>

```swift    
func swap(_ a: inout Int, _ b: inout Int) -> Void {
    let temp: Int = a
    a = b
    b = a
}
    
func solution() -> Void {
    var a: Int = 5
    var b: Int = 10
        
    swap(&a, &b)
        
    print(a, b) // 10, 5
}
solution()
```

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/String%20Algorithm">=> 문자열 예제</a></pre>

<hr>
</hr>

### 21. 재귀함수(Recursive Function)
<pre>
1. 자기자신을 부르는 함수
2. 재귀함수도 함수이기 때문에 값을 입력받아 특정 연산을 수행하여 결과를 반환함
3. 귀납적 계산 방법을 따름
4. 귀납적 계산법이란, f(x)를 구하기 위해 또 다시 f(x)를 활용함
5. 귀납적 계산법은 계산하기 위해 자기자신을 사용하는 식과 멈춰야 하는 기저조건이 존재함
</pre>

### 21.1. 수학적 귀납법
<pre>
1. 명제 P(n)이 모든 자연수 n에 대하여 성립함을 보이는 것
2. 증명 순서 : 1. P(1)이 참임을 보임, 2. P(k)가 성립한다고 가정한 후, P(k + 1)이 성립함을 보임, 3. 따라서 모든 자연수 n에 대하여 P(n)이 성립함
3. 재귀함수가 정확한 값을 반환하는지 증명하기 위해 수학적 귀납법을 사용함
</pre>

### 21.2. 재귀함수 디자인 절차
<pre>
1. 먼저 문제 속에서 재귀적 패턴(자기자신을 사용하는 패턴)을 파악해야 함
2. 함수의 역할을 말로서 정확하게 정의함
3. 기저조건에서 함수가 제대로 동작함을 보임
4. 함수가 제대로 동작한다고 가정하고 함수를 완성함
</pre>

```swift
func getFactorial(_ N: Int) -> Int {
    //N의 Factorial을 구하는 함수, 0! = 1
    //Base Condition(기저조건)
    if N == 0 {
        return 1
    }
    
    return N * getFactorial(N - 1)
}
```

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Recursive%20Function">=> 재귀함수 예제</a></pre>

<hr>
</hr>

### 22. Back-tracking(Advanced Brute-Force Algorithm)
<pre>
1. 모든 경우를 시도해 보는 코드를 구현하기가 까다로운 경우
2. 가령, 문제의 크기 N에 따라 N중 반복문을 구현해야 하는 경우
3. 재귀호출을 이용하여 편리하게 구현할 수 있음
4. ex) 순열 구하기
</pre>

### 22.1. Back-tracking Idea

```swift
func doRecursion(_ x: Int) -> Void {
    //x 번째 for문을 실행
    if x > n {
        print(numbers)
    } else {
        for i = 1 ~ n {
            if 아직 숫자 i가 없다면,
            x번째 for에서 숫자 i를 등록하고,
            doRecursion(x + 1)
        }
    }
}
```

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Back-tracking%28Advanced%20Brute-Force%29">=> Back-tracking 예제</a></pre>

<hr>
</hr>

### 23. 고급 정렬(Advanced Sort)
<pre>
1. 특정 기준을 적용하여 나열함
2. 기본 정렬 : 선택 정렬, 삽입 정렬, 버블 정렬
3. 기본 정렬 시간복잡도 : O(n^2)
4. O(n log n)만에 정렬할 수 있는 알고리즘 : 합병 정렬, 퀵 정렬, 힙 정렬
</pre>

### 23.1. 로그의 개념과 그 효율성
<pre>
1. 로그의 정의 : 지수함수의 역함수, logx(y) = z ----> x ^ z = y
2. 즉, x를 몇 번 곱해야 y가 되는가?
3. 컴퓨터공학에서 log를 사용하는 경우, 그 밑이 2 이므로 보통 밑을 생략
4. log가 있는 경우, 시간 복잡도를 많이 줄일 수 있으므로 효율적인 알고리즘
</pre>

### 23.2. 합병 정렬(Merge Sort)
<pre>
1. 재귀호출을 이용함
2. 배열을 절반으로 나누어 각가을 정렬한 후 합침
3. 시간 복잡도 : O(n log n)
</pre>

### 23.2.1. 합병 정렬의 구현
<pre>
1. 재귀함수이므로, 재귀함수 디자인 규칙을 따름
2. void mergeSort(array, start, end)    // array를 start번 째 값 부터 end번 째 값 까지 합병 정렬하는 함수
</pre>

```swift
var array: [Int] = [-1, 2, 5, 10, 8]
var tempArray: [Int] = Array(repeating: 0, count: array.count + 10)
    
func mergeing(_ s1: Int, _ s2: Int, _ e1: Int, _ e2: Int) -> Void {
    var p: Int = s1, q: Int = s2, tempIndex: Int = 0
        
    while p <= e1 && q <= e2 {
        if array[p] < array[q] {
            tempArray[tempIndex] = array[p]
            tempIndex += 1
            p += 1
        } else {
            tempArray[tempIndex] = array[q]
            tempIndex += 1
            q += 1
        }
    }
        
    if p > e1 {
        for i in stride(from: q, through: e2, by: 1) {
            tempArray[tempIndex] = array[i]
            tempIndex += 1
        }
    } else {
        for i in stride(from: p, through: e1, by: 1) {
            tempArray[tempIndex] = array[i]
            tempIndex += 1
        }
    }
        
    for i in stride(from: s1, through: e2, by: 1) {
        array[i] = tempArray[i - s1]
    }
}
    
func mergeSort(_ start: Int, _ end: Int) -> Void {
    //array의 start 부터 end까지 합병정렬 하는 함수
    if start >= end {
        return
    }
        
    let mid: Int = (start + end) / 2
    mergeSort(start, mid)
    mergeSort(mid + 1, end)
    
    merging(start, mid, mid + 1, end)
}
```

### 23.3. 퀵 정렬(Quick Sort)
<pre>
1. 재귀호출을 이용함
2. 원소를 하나 정하여(pivot), 해당 원소보다 작은 수, 큰 수로 배열을 나눔
3. 시간 복잡도 : pivot이 원소를 절반으로 나눈다고 가정했을 때, 평균적으로 O(n log n)이고, 원소가 이미 정렬되어 있는 경우(최악의 경우) O(n^2)
</pre>

### 23.3.1. 퀵 정렬의 구현
<pre>
1. 재귀함수이므로, 재귀함수 디자인 규칙을 따름
2. void quickSort(array, start, end)    // array를 start번 째 값 부터 end번 째 값 까지 퀵 정렬하는 함수
</pre>

```swift
func getLeft(_ array: [Int], _ start: Int, _ end: Int, _ pivot: Int, _ left: inout [Int]) -> Int {
    var index: Int = 0
    for i in start...end {
        if array[i] <= pivot {
            left[index] = array[i]
            index += 1
        }
    }

    return index
} 

func getRight(_ array: [Int], _ start: Int, _ end: Int, _ pivot: Int, _ right: inout [Int]) -> Int {
    var index: Int = 0
    for i in start...end {
        if array[i] > pivot {
            right[index] = array[i]
            index += 1
        }
    }
    
    return index
}

func quickSort(_ array: inout [Int], _ left: inout [Int], _ right: inout [Int], _ start: Int, _ end: Int) {
    //array의 start 번 째 값 부터 end 번 째 값 까지 퀵 정렬 하는 함수
    if start >= end {
        return
    }
        
    let pivot: Int = array[start]
    let leftCount: Int = getLeft(array, start + 1, end, pivot, &left)
    let rightCount: Int = getRight(array, start + 1, end, pivot, &right)
        
    for i in 0..<leftCount {
        array[start + i] = left[i]
    }
        
    array[start + leftCount] = pivot
        
    for i in 0..<rightCount {
        array[start + leftCount + 1 + i] = right[i]
    }
        
    quickSort(&array, &left, &right, start, start + leftCount - 1)
    quickSort(&array, &left, &right, start + leftCount + 1, end)
}
```

### 23.4. 대표 정렬 알고리즘 시간 복잡도 비교(Time Complexity Of Sort Algorithm)

|-|선택 정렬(Selection)|삽입 정렬(Insertion)|버블 정렬(Bubble)|합병 정렬(Merge)|퀵 정렬(Quick)|
|---|---|---|---|---|---|
|평균 시간복잡도|-|-|-|-|O(N log N)|
|최악의 경우|O(N^2)|O(N^2)|O(N^2)|O(N log N)|O(N^2)|

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Sort%20Algorithm">=> 고급 정렬 알고리즘 예제</a></pre>

<hr>
</hr>

### 24. 이진 탐색(Binary Search)
<pre>
1. 탐색 : 특정 값을 찾음
2. 이진 탐색 : 정렬되어 있는 값들 중에서 특정 값을 찾는 것
3. 찾고자 하는 값과 중간 값을 비교하여 절반씩 제거할 수 있음
4. 숫자를 절반씩 지워나가기 때문에 O(log n)의 시간 복잡도를 가짐
5. 이미 정렬되어 있다면, 이진 탐색이 굉장히 효율적이고, 정렬을 다시 하더라도 숫자를 엄청 많이 탐색해야 하는 경우에도 효율적임
</pre>

### 24.1. 이진 탐색의 구현
<pre>
1. 이미 정렬되어 있다고 가정
2. 재귀함수를 이용하여 구현할 수도 있고, 단순 반복문을 통해 구현할 수도 있음
3. 재귀함수 : int binarySearch(array, start, end, value)    //  array의 start번째 값 부터 end번째 값 중 value를 찾는 함수
4. 단순 반복문 : 투 포인터(start, end)를 활용하여 구현
</pre>

```swift
func binarySearch(_ array: [Int], _ start: Int, _ end: Int, _ value: Int) -> Bool {
    if start >= end {
        return array[start] == value ? true : false
    }
        
    let mid: Int = (start + end) / 2
    if array[mid] == value {
        return true
    }
        
    return array[mid] < value ? binarySearch(array, mid + 1, end, value) : binarySearch(array, start, mid - 1, value)
}
```

### 24.2. 매개 변수 탐색(Parametric Search)
<pre>
1. Binary Search를 이용하여 문제를 해결하는 테크닉
2. 원래의 값들을 대신할 수 있는 매개변수들이 정렬되어 있는 경우 사용할 수 있음
3. 원래의 값들을 통해 매개 변수를 구하기 위한 별도 작업이 필요함
</pre>

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Binary%20Search">=> 이진 탐색 예제</a></pre>

<hr>
</hr>

### 25. 기본 자료구조(Basic Data-Structure)
<pre>
1. 자료를 저장하는 구조
2. Stack, Queue, Tree, Graph ...
3. 특정 목적에 따라 자료를 저장하는 방법이 달라 목적(각 장단점에 의거)에 맞게 사용할 수 있어야 함
4. 저장되어 있는 자료구조를 바탕으로 의미있는 결과를 도출하는 과정이 알고리즘
5. 가장 기본이 되는 자료구조 : 변수, 배열
</pre>

### 25.1. 배열 VS 연결 리스트

|-|배열(Array / ArrayList)|연결 리스트(Linked List)|
|---|---|---|
|장점|탐색이 빠름|배열에 비해 삽입/삭제 연산이 빠름|
|단점|삽입/삭제 연산이 느림|배열에 비해 탐색이 느림|
|탐색 시간 복잡도|O(1)|O(N)|
|삽입 시간 복잡도|평균적으로 O(N)|평균적으로 O(1)|
|삭제 시간 복잡도|평균적으로 O(N)|평균적으로 O(1)|

### 25.2. 캡슐화(Encapsulation)
<pre>
1. 자료구조 구현의 핵심
2. 자료구조를 사용하는 사람은 자료구조가 어떻게 동작하는지 알 필요가 없음
3. 구현한 사람외에 사용하는 사람은 사용법만 알아야 함
</pre>

### 25.3. 구조체(Struct)
<pre>
1. 캡슐화를 통해 구현하며, 캡슐화를 구현하기 위해 사용
2. 하나의 자료형(Type)을 정의할 수 있음
3. 여러 프로퍼티와 메소드로 이루어져 있어, 관련된 데이터끼리 묶을 수 있음
</pre>

### 26. 스택(Stack)
<pre>
1. Computer Science의 대표적인 자료구조 중 하나
2. Linear(선형) 자료구조
3. 자료를 쌓으면서 저장하는 자료구조
4. Last In First Out(LIFO) 특징을 가지고 있어, 순서를 뒤집거나 발자취를 기록할 때 사용할 수 있음
5. Push/Pop 연산이 가능함
6. Stack Overflow : Stack은 정해진 크기가 있어, 용량이 다 찼음에도 불구하고 데이터를 삽입할 경우 Stack Overflow에러 발생
7. Stack Underflow : Stack이 비었음에도 불구하고 데이터를 삭제하려고 하는 경우
</pre>

```swift
//MARK: - Type
struct Stack {
    //MARK: - Property
    var array: [Int]
    var len: Int
    var capacity: Int
        
    //MARK: - Initializer
    init(_ capacity: Int) {
        self.capacity = capacity
        self.array = Array(repeating: 0, count: capacity)
        self.len = 0
    }
        
    //MARK: - Method
    mutating func push(_ data: Int) -> Void {
        if len >= capacity {
            print("Overflow")
        } else {
            self.array[self.len] = data
            self.len += 1
        }
    }
        
    mutating func pop() -> Void {
        if self.len <= 0 {
            print("Underflow")
        } else {
            self.array[self.len - 1] = 0
            self.len -= 1
        }
    }
        
    func top() -> Int {
        return self.len <= 0 ? -1 : self.array[len - 1]
    }
}
```

### 27. 큐(Queue)
<pre>
1. Stack과 함께 Computer Science의 기초 자료구조 중 하나
2. First In First Out(FIFO) 구조
3. Linear(선형) 자료구조
4. Queue Overflow : Queue의 용량보다 데이터를 더 넣으려고 하는 경우
5. Queue Underflow : Queue에 데이터가 없는데 데이터를 삭제하려고 하는 경우
6. 단순 투 포인터로 큐를 구현하게 되는 경우 push / pop 연산시 두 포인터가 모두 증가만 하게되므로. 앞의 공간에 대한 낭비가 발생할 수 있음
</pre>

### 27.1. 원형 큐의 개념과 구현방법(Circular Queue)
<pre>
1. 선형큐의 공간 낭비의 단점을 해결하기 위한 큐
2. 선형큐에 비해 공간 활용 능력이 우수
3. 원소의 개수를 유지하는 별도의 변수가 필요함
4. front, rear 투 포인터가 끝에 도달하게되면 push / pop 연산시 다시 처음으로 되돌리는 원형의 형태
</pre>

```swift
//MARK: - Type
struct Queue {
    //MARK: - Property
    private var array: [Int]
    private var f: Int
    private var r: Int
    private var capacity: Int
        
    //MARK: - Initializer
    init(_ capacity: Int) {
        self.capacity = capacity
        self.array = Array(repeating: 0, count: capacity)
        self.f = 0
        self.r = 0
    }
    
    //MARK: - Method
    mutating func push(_ data: Int) -> Void {
        if self.r >= self.capacity {
            print("Overflow")
        } else {
            self.array[self.r] = data
            self.r += 1
        }
    }
        
    mutating func pop() -> Void {
        if self.r - self.f <= 0 {
            print("Underflow")
        } else {
            self.array[self.f] = 0
            self.f += 1
        }
    }
        
    func front() -> Int {
        return self.r - self.f <= 0 ? -1 : self.array[self.f]
    }
        
    func size() -> Int {
        return self.r - self.f
    }
}
```

### 27.2. 스택 & 큐 정리(Stack & Queue Summary)
<pre>
1. 특정 자료구조가 무엇인지 아는 것은 중요하지 않고, 의도에 맞게 사용하는 능력이 중요함
2. 올바른 괄호 판단 문제는 대표적인 stack 자료구조를 활용하는 문제
3. Stack과 Queue에는 상태(status) 즉, 해야하는 작업이 저장됨
4. Stack의 경우, 함수 호출에 대한 복귀 주소 즉, 발자취를 기록을 해두며, 이를 Call Stack이라고 함(Stack의 Scheduling, 재귀호출)
5. Queue의 경우, Stack과 달리 상태의 의존관계가 없을 때, 즉 해야 하는 작업을 진행할 때 다른 작업에 영향을 받지 않고 순서대로 처리하며, 대표적으로 스케쥴링, 병렬화에 많이 사용됨
</pre>

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Stack">=> 스택 예제</a></pre>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Queue">=> 큐 예제</a></pre>

<hr>
</hr>

### 28. 트리(Tree)
<pre>
1. 트리 역시 자료를 담는 Computer Science의 기초 자료구조 중 하나
2. 계층형(Hierarchy) 자료구조
3. 정점(Node), 간선(Edge)로 이루어져 있으며, 간선은 두 정점을 잇는 선
4. 부모와 자식관계를 가지며 레벨은 높이를 뜻함
5. 트리는 그 안에 또 트리가 존재하며(재귀적 성질), 이를 서브트리(Subtree)라고 함
6. 최상위 부모노드를 root라고 함
</pre>

### 28.1. 트리의 순회(Tree Traversal)
<pre>
1. 트리 내에 어떠한 자료가 담겨 있는지를 알기 위한 방법
2. 순회하는 방법은 많지만, 재귀적 성질을 이용해서 순회하는 방법이 젤 중요함
</pre>

### 28.1.1. 이진 트리 재귀적 순회 방법
<pre>
1. 자식노드가 2개 이하인 트리를 Binary Tree(이진 트리)라고 함
2. 전위 순회 : Root - L(Left Subtree) - R(Right Subtree)
3. 중위 순회 : L(Left Subtree) - Root - R(Right Subtree)
4. 후위 순회 : L(Left Subtree) - R(Right Subtree) - Root
5. 세가지 순회방법이 목적은 트리 내의 자료를 탐색하는 것으로 같지만, 특성이 다름
</pre>

```swift
//MARK: - Type
struct Node {
    //MARK: - Property
    var left: Int
    var right: Int
    
    //MARK: - Initializer
    init(_ left: Int, _ right: Int) {
        self.left = left
        self.right = right
    }
}

//MARK: - Function
func preOrder(_ tree: [Node], _ root: Int) -> Void {
    if root == -1 {
        return
    }
        
    print("\(root) ", terminator: "")
    preOrder(tree, tree[root].left)
    preOrder(tree, tree[root].right)
}

func inOrder(_ tree: [Node], _ root: Int) -> Void {
    if root == -1 {
        return
    }
        
    inOrder(tree, tree[root].left)
    print("\(root) ", terminator: "")
    inOrder(tree, tree[root].right)
}

func postOrder(_ tree: [Node], _ root: Int) -> Void {
    if root == -1 {
        return
    }
    
    postOrder(tree, tree[root].left)
    postOrder(tree, tree[root].right)
    print("\(root) ", terminator: "")
}
```

### 28.2. 우선순위 큐(Priority Queue)
<pre>
1. Tree를 활용하는 대표적인 예제
2. 원소를 제거할 때, 우선순위가 가장 높은 원소를 제거
3. 배열로 우선순위 큐를 구현하게 되면, 삽입 연산은 효율적이지만 삭제 연산의 경우 비효율적일 수 있음
</pre>

### 28.2.1. 힙(Heap)
<pre>
1. 부모의 값이 항상 자식보다 우선순위가 높은 완전이진트리
2. 자식노드가 2개 이하인 이진트리 이면서, 값이 왼쪽부터 채워지는 트리를 완전이진트리라고 함
3. 힙에 값을 삽입하게 되면, 완전이진트리 특성에 따라 왼쪽부터 채워지고, 부모와 자식 사이의 우선순위를 비교하여 트리를 재구성해야 함
4. 노드가 n개일 때, 높이가 대략 log n이므로 높이가 1개 증가할 때 마다 노드는 약 2배 증가하게 됨
5. 즉, 삽입 연산 시 최악의 경우 트리의 높이 만큼 비교 연산을 수행 하므로, O(log n)의 시간복잡도를 가짐
6. 힙에서 삭제 연산을 하게 되면, 우선순위가 가장 높은 root를 삭제하고, 가장 끝에 있는 자식 노드를 root로 옮기고 우선순위를 비교하여 트리를 재구성해야 함
7. 삽입 연산과 마찬가지로 root에서 최대로 트리의 높이 만큼 내려올 수 있으므로, O(log n)의 시간복잡도를 가짐  
</pre>

### 28.2.2. 우선순위 큐 구현(배열)

```swift
//MARK: - Type
struct PriorityQueue {
    //MARK: - Property
    private var data: [Int]
    private var len, capacity: Int
    
    //MARK: - Initiailzer
    init(_ capacity: Int) {
        self.capacity = capacity
        self.data = Array(repeating: 0, count: capacity + 10)
        self.len = 0
    }
        
    //MARK: - Method
    mutating func push(_ x: Int) -> Void {
        self.data[self.len] = x
        self.len += 1
    }
        
    mutating func pop() -> Void {
        var min: Int = self.data[0], minIndex: Int = 0
        for i in 0..<self.len {
            if min > self.data[i] {
                min = self.data[i]
                minIndex = i
            }
        }
            
        for i in minIndex..<self.len {
            self.data[i] = self.data[i + 1]
        }
        
        self.len -= 1
    }
        
    func top() -> Int {
        var min: Int = self.data[0]
        for i in 0..<self.len {
            min = min > self.data[i] ? self.data[i] : min
        }
            
        return min
    }
}
```

### 28.2.3. 우선순위 큐 구현(힙)

```swift
//MARK: - Type
struct PriorityQueue {
    //MARK: - Property
    var data: [Int]
    var len, capacity: Int
    
    //MARK: - Initializer
    init(_ capacity: Int) {
        self.capacity = capacity
        self.data = Array(repeating: 0, count: self.capacity + 10)
        self.len = 1
    }
        
    //MARK: - Method
    mutating func push(_ x: Int) -> Void {
        self.data[self.len] = x
        self.len += 1
            
        var currentIndex: Int = self.len - 1
        while currentIndex > 1 {
            if self.data[currentIndex] < self.data[currentIndex >> 1] {
                let temp: Int = self.data[currentIndex]
                self.data[currentIndex] = self.data[currentIndex >> 1]
                self.data[currentIndex >> 1] = temp
                
                currentIndex >>= 1
            } else {
                break
            }
        }
    }
        
    mutating func pop() -> Void {
        self.data[1] = self.data[self.len - 1]
        self.data[self.len - 1] = 0
        self.len -= 1
            
        var currentIndex: Int = 1
        while true {
            var childIndex: Int = -1
                
            if self.len - 1 < (currentIndex << 1) {
                break
            } else if (0 < (currentIndex << 1) && (currentIndex << 1) <= self.len - 1) && (currentIndex << 1 + 1) > self.len - 1 {
                childIndex = currentIndex << 1
            } else {
                childIndex = (currentIndex << 1) < (currentIndex << 1 + 1) ? (currentIndex << 1) : (currentIndex << 1 + 1)
            }
                
            if self.data[currentIndex] > self.data[childIndex] {
                let temp: Int = self.data[currentIndex]
                self.data[currentIndex] = self.data[childIndex]
                self.data[childIndex] = temp
                    
                currentIndex = childIndex
            } else {
                break
            }
        }
    }
        
    func top() -> Int {
        return self.data[1]
    }
}
```

### 28.2.4. 우선순위 큐의 구현 요약

|-|배열|힙|
|------|---|---|
|값의 삽입|O(1)|O(log n)|
|값의 삭제|O(n)|O(log n)|
|값의 탐색|O(n)|O(1)|

<pre>
1. 삽입 연산이 배열이 빠르긴 하지만, 삭제 연산에서 차이가 많이 발생하므로, 우선순위 큐를 구현해야 한다면 힙으로 구현하는 것이 바람직함
2. 힙의 경우 완전이진트리이기 때문에, 배열을 이용하여 구현할 수 있음
</pre>

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Tree">=> 트리 예제</a></pre>

<hr>
</hr>

### 29. 문제 해결의 절차
<pre>
1. 문제를 정확히 이해한다.
2. 문제를 해결하는 알고리즘을 설계한다.
3. 설계한 알고리즘이 문제를 해결한다는 것을 수학적으로 증명한다.
4. 알고리즘이 제한 시간 내에 동작한다는 것을 보인다.(시간복잡도)
5. 알고리즘을 코드로 작성한다.
</pre>

### 29.1. 문제 해결의 기본
<pre>
1. 문제 해결을 위해 고려해야 하는 모든 경우를 파악해야 함.(탐색 공간)
2. 가장 첫 번째로 시도해보아야 하는 알고리즘은 완전탐색(Brute-Force Algorithm)
3. 완전탐색으로 시간안에 문제 해결이 되지 않을 때는 알고리즘을 개선해 나가야 함.
4. 시간복잡도 계산을 위해 설계한 알고리즘에 대한 의사코드를 작성해야 함.
5. 완전탐색이 시간안에 동작하지 못할 때 개선할 수 있는 알고리즘 : 이진 탐색, 분할 정복, 동적 계획법(DP), Greedy, Graph Algorithm(DFS, BFS, 최단거리 등) 등
</pre>

### 30. 분할 정복(Divde and Conquer)
<pre>
1. 문제를 소문제로 분할
2. 각각의 소문제를 해결
3. 소문제의 해결 결과를 이용하여 전체 문제를 해결
4. 합병 정렬, 퀵 정렬이 대표적인 예
5. 분할 정복법은 소문제도 분할 정복법으로 해결하기 때문에 재귀호출과 관련이 깊음(재귀호출을 이용하여 구현하는 경우가 많음)
</pre>

#### 30.1. 분할 정복 예제 - 연속 부분 최대합

```swift
func getSubMax(_ array: [Int], _ start: Int, _ end: Int) -> Int {
    //array의 start 부터 end 까지의 연속 부분 최대합을 반환하는 함수
    if start >= end {
        return array[start]
    }
        
    let mid: Int = (start + end) / 2
    let leftSubMax: Int = getSubMax(array, start, mid)
    let rightSubMax: Int = getSubMax(array, mid + 1, end)
    
    var leftSum, leftMax, rightSum, rightMax, middleSubMax: Int
    leftSum = 0
    leftMax = -987987987
    rightSum = 0
    rightMax = -987987987
        
    for i in stride(from: mid, through: start, by: -1) {
        leftSum += array[i]
        
        leftMax = leftMax < leftSum ? leftSum : leftMax
    }
        
    for i in mid + 1...end {
        rightSum += array[i]
            
        rightMax = rightMax < rightSum ? rightSum : rightMax
    }

    middleSubMax = leftMax + rightMax
    
    if leftSubMax > rightSubMax && leftSubMax > middleSubMax {
        return leftSubMax
    } else if rightSubMax > leftSubMax && rightSubMax > middleSubMax {
        return rightSubMax
    } else {
        return middleSubMax
    }
}
```

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Divide%26Conquer%20Algorithm">=> 분할 정복 예제</a></pre>

<hr>
</hr>

### 31. 기초 동적 계획법(Basic Dynamic Programming)
<pre>
1. 부분 문제를 해결한 결과를 이용하여 전체 문제를 해결
2. "나"를 해결함으로써 "나"를 해결하는 구조
3. 대표적인 예로 피보나치 수열이 있음
4. 분할 정복법과 차이는 큰 문제를 독립적으로 나누는 것과 달리, 작은 "나"를 해결한 결과를 계속해서 사용한다는 점
5. 따라서, 작은 소문제를 먼저 모두 기억해 놓는 것이 동적 계획법의 아이디어
6. 분할 정복법은 Top-Down Approach, 동적 계획법은 Bottom-Up Approach
</pre>

```swift
//MARK: - Function
func solution() -> Void {
    //MARK: - Input
    guard let n: Int = Int(readLine() ?? "0") else { return }
    var fibonacci: [Int] = Array(repeating: 0, count: n + 10)
    
    //MARK: - Process
    fibonacci[0] = 0
    fibonacci[1] = 1
    if n >= 2 {
        for i in 2...n {
            fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2]
        }
    }
        
    //MARK: - Output
    print(fibonacci[n])
}
```

### 31.1. 동적 계획법의 문제 풀이 순서
<pre>
1. 부분 문제를 정의 -> 무슨 값을 구할지를 정의
2. 점화식을 구함 -> 그 값을 어떻게 구할지에 대한 식을 세움
3. 문제를 해결 -> 코드 작성
</pre>

### 32. 중급 동적 계획법(Intermediate Dynamic Programming)
<pre>
1. [1, 2, -4, 5, 3, -2, 9, 10] 다음과 같은 수열에서 연속부분최대합을 구하는 문제에 대해
2. 완전탐색의 경우 O(N^2), 분할정복법의 경우 O(N log N)의 시간복잡도로 해결할 수 있음
3. 동적계획법을 활용하면 이 문제를 O(N)으로 해결할 수 있으므로, 해당 문제에 대해 위 3가지 알고리즘 중에 가장 효율적인 알고리즘
4. 가장 빠르고, 구현도 쉽지만 구현까지 오는데 과정이 제일 복잡하므로, 동적 계획법의 경우는 키보드에서 손을 떼고,
5. 종이와 펜으로 설계를 정확하게 하는데 초점을 맞추어야 함
</pre>

### 32.1. 동적 계획법 정리
<pre>
1. 부분 문제를 정의하는 것이 가장 어려움
2. 문제가 "재귀적으로 해결되는지"(나를 통해 나를 해결할 수 있는지)를 볼 줄 알아야 함
3. 무조건 많은 예제를 풀어보아야 함
</pre>

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Dynamic%20Programming">=> 동적 계획법 예제</a></pre>

<hr>
</hr>

### 33. 그래프(Graph)
<pre>
1. Computer Science의 대표적인 자료구조 중 하나
2. 정점(Node, vertex)과 간선(Edge)로 이루어진 자료구조
3. 차수(Degree) : 각 정점에 연결되어 있는 간선의 개수
4. 사이클(Cycle) : 자기 자신으로 다시 돌아올 수 있는 경로
5. 현실 세계의 많은 것들을 그래프로 나타낼 수 있기 때문에 그래프와 관련된 문제가 매우 많음
</pre>

### 33.1. 그래프에 관한 중요한 수학적 지식
<pre>
1. 간선의 개수는 대략적으로 정점의 제곱보다 작거나 같음(정확히는 nC2 보다 작거나 같음)
2. 즉, 간선의 최대 개수 = 정점의 개수 x (정점의 개수 - 1) / 2 혹은 간선의 개수는 정점의 개수 x (정점의 개수 - 1) / 2 보다 작거나 같음
3. 차수의 합 = 간선의 개수 x 2 
</pre>

### 33.2. 그래프의 구현 1 : 인접 행렬
<pre>
1. 정점의 연결 관계를 2차원 배열에 0, 1로 표현
2. 그래프에서 할 수 있는 질문은 x, y가 연결돼 있는가?, x와 연결된 정점이 모두 무엇인가? 정도로 말할 수 있음
3. 인접 행렬로 그래프를 구현했을 때 장점 : 두 정점 연결 여부를 O(1)에 알 수 있음
4. 인접 행렬로 그래프를 구현했을 때 단점 : 인접한 정점을 모두 찾는데 O(n)이 걸리며, n^2의 공간이 필요함
</pre>

```swift
func solution() -> Void {
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
        
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int = input.map { Int($0) }[1] ?? 0
    var myGraph: [[Int]] = Array(repeating: Array(repeating:0, count: n + 10), count: n + 10)
        
    for _ in 0..<m {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
            
        myGraph[a][b] = 1
        myGraph[b][a] = 1
    }
}
```

### 33.3. 그래프의 구현 2 : 인접 리스트
<pre>
1. 각각의 정점에 대하여 인접한 정점 번호를 저장함
2. 장점 : 인접한 정점을 모두 찾는 것이 O(degree) 인접 행렬보다 빠르며, 필요한 만큼만 공간을 활용함
3. 단점 : x와 y 두 정점 연결 여부를 찾는 것이 O(degree)로 인접 행렬의 O(1)에 비해 느림
</pre>

```swift
func solution() -> Void {
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let n: Int = input.map { Int($0) }[0] ?? 0
    let m: Int = input.map { Int($0) }[1] ?? 0
    var myGraph: [Graph] = Array(repeating: Graph(), count: n + 10)
    
    for _ in 0..<m {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
            
        myGraph[a].edges.append(b)
        myGraph[b].edges.append(a)
    }
}
```

### 34. 그래프 탐색(Graph Traversal)
<pre>
1. 그래프라는 자료구조에 어떠한 값이 저장되어 있는가?
2. 위 질문을 알기 위해서 그래프를 순회해야 하는데, 대표적인 알고리즘으로, 깊이우선탐색, 너비우선탐색이 있음
3. 트리의 Pre-Order, In-Order, Post-Order 각각의 트리를 순회한다는 목적이 같고 방법만 다른 것과 마찬가지로, 깊이우선탐색과 너비우선탐색의 목적은 그래프 탐색으로 같지만 그 방법이 다름
</pre>

### 34.1. 깊이우선탐색(Depth First Search, DFS)
<pre>
1. Stack을 이용하여 그래프를 순회하는 방법
2. 나를 먼저 방문하고, 그 다음으로 인접한 노드를 차례로 방문. 단, 방문했던 노드는 방문하지 않음
3. Stack을 이용하기 때문에 재귀함수로 구현할 수 있음
4. DFS는 모든 정점을 방문하고, 하나의 정점을 두번 이상 방문하지 않기 때문에 정확함
5. O(노드의 개수 + 차수의 합) = O(노드의 개수 + 간선의 개수 x 2) = O(노드의 개수 + 간선의 개수) = O(V + E)의 시간복잡도를 가짐
</pre>

### 34.2. 너비우선탐색(Breadth First Search, BFS)
<pre>
1. Queue를 이용하여 그래프를 순회하는 방법
2. 깊이우선탐색과 그래프 탐색이라는 목적은 같고 방법이 다르기 때문에, 탐색하는 순서가 다름
3. 인접한 노드들을 우선 모두 색칠해 두고, 뻗어 나가는 철학을 가지고 있음
4. 시작점을 색칠하고 큐에 넣고, 큐에서 현재 위치를 빼고 인접한 노드들을 색칠하고 큐에 넣고 위와 같은 과정을 큐가 빌 때 까지 계속해서 반복함
5. 깊이우선과 마찬가지로 O(V + E)의 시간복잡도를 가짐
</pre>

```swift
func dfs(_ x: Int) -> Void {
    visited[x] = true
    print("\(x) ", terminator: "")
    
    for i in stride(from: 0, to: graph[x].edges.count, by: 1) {
        let y: Int = graph[x].edges[i]
        
        if !visited[y] {
            dfs(y)
        }
    }
}

func bfs(_ start: Int) -> Void {
    var queue: [Int] = []
    queue.append(start)
    visited[start] = true
    
    while !queue.isEmpty {
        let current: Int = queue.removeFirst()
        print("\(current) ", terminator: "")
        
        for i in stride(from: 0, to: graph[current].edges.count, by: 1) {
            let next: Int = graph[current].edges[i]
            
            if !visited[next] {
                visited[next] = true
                queue.append(next)
            }
        }
    }
}
```

### 35. 그래프 알고리즘
### 35.1. 최단 경로 알고리즘(Shortest Path Finding Algorithm)
<pre>
1. 간선의 가중치가 존재하는 그래프에서의 최단 경로를 찾는 알고리즘
2. 간선의 가중치가 없는 그래프에서는 BFS 알고리즘으로 최단 경로를 찾을 수 있음
3. 반면 가중치가 존재하게 되면, A에서 B까지 간선의 가중치의 합이 최소가 되는 경로가 최단 경로가 됨
4. 위 문제를 해결하는 대표적인 3가지 그래프 알고리즘이 있음
5. 다익스트라 알고리즘(Dijkstra's Algorithm), 플로이드 알고리즘(Floyd Algorithm), 벨만포드 알고리즘(Bellman-Ford Algorithm)
6. 최단 경로의 특징 : 정점 X 까지 최단거리로 가기 위해서는 그 직전 까지도 최단거리로 가야하며, 그 직전까지의 최단거리에서 직전부터 X까지의 최단 거리를 구함으로써 문제를 해결할 수 있음
</pre>

### 35.1.1. 최단 경로 알고리즘 - 다익스트라 알고리즘(Dijkstra's Algorithm)
<pre>
1. 가중치가 존재하는 그래프에서의 최단 경로를 구하는 알고리즘 중 가장 대표적인 알고리즘
2. 가중치가 양수일때만 가능한 알고리즘
3. 한 정점으로부터 모든 정점까지의 최단 거리를 구할 수 있음
4. 최단 경로는 유일하기 때문에 사이클이 없는 그래프 즉, 트리를 만들 수 있음(최단 경로 트리)
</pre>

### 35.1.2. 다익스트라 알고리즘 구현
<pre>
1. 시작점은 가중치의 합이 0 즉, 최단 경로가 0
2. 시작점부터 현재 가중치의 합이 최소인 지점의 정점 번호를 찾고, 방문처리를 함
3. 그 후 뻗어 나갈 수 있는 인접한 정점에 대한 가중치와 시작점에서 인접한 정점까지의 가중치의 합 중 최솟값을 각 정점에 해당하는 가중치 배열에 저장
4. 다시 현재 방문하지 않은 정점 중에서 최솟값을 찾고 방문처리를 함
5. 위 과정을 모든 정점에 대해 반복하면, 시작점으로부터 모든 정점의 최단 경로를 구할 수 있음
</pre>

```swift
func dijkstra(_ N: Int, _ start: Int, _ end: Int) -> Int {
    var distances: [Int] = Array(repeating: 987987987, count: N + 10)
    distances[start] = 0
    
    for _ in 0..<N {
        var minCost, minIndex: Int
        minCost = 987987987
        minIndex = -1
            
        for j in 0..<N {
            if !visited[j] && minCost > distances[j] {
                minCost = distances[j]
                minIndex = j
            }
        }
        visited[minIndex] = true
            
        for j in 0..<graph[minIndex].edges.count {
            let y: Int = graph[minIndex].edges[j]
            let cost: Int = graph[minIndex].costs[j]
                
            if distances[y] > distances[minIndex] + cost {
                distances[y] = distances[minIndex] + cost
            }
        }
    }
        
    return distances[end]
}
```

### 35.2. 최소 신장 트리(Minimum Spanning Tree)
<pre>
1. 스패닝 트리 : 그래프의 모든 노드를 포함하는 트리(사이클이 없는 그래프)
2. 스패닝 트리의 모든 가중치의 합을 스패닝 트리의 가중치라고 함
3. 여러 스패닝 트리의 가중치 중 그 값이 최소가 되는 스패닝 트리를 최소 신장(스패닝) 트리라고 함
4. 최소 신장 트리를 구하는 알고리즘으로 대표적인 크루스칼 알고리즘(Kruskal's Algorithm)이 있음
</pre>

### 35.2.1. 최소 신장 트리 - 크루스칼 알고리즘(Kruskal's Algorithm)
<pre>
1. Cut Property : 최소 신장 트리를 구하기 위해서 가장 먼저 알아야할 개념, 두 개의 Tree를 하나의 간선으로 연결할 때, 그 가중치가 가장 작은 간선으로 연결하는 것을 말함
2. 크루스칼 알고리즘은 각 노드를 하나의 MST로 보고 시작, 간선의 가중치가 작은 것부터 결정해 나가되, 사이클이 없어야 함.
3. 사이클이 생기는 조건은 서로 다른 트리를 잇는 것은 문제되지 않으나, 하나의 트리 내에서 하나의 간선만 추가하더라도 사이클이 생김
4. 따라서 두 노드가 같은 트리 내에 있는지, 즉 사이클이 생기는지 여부를 판단하기 위해 Disjoint Set이라는 자료구조를 활용할 수 있음
5. Disjoint Set은 두 정점 혹은 두 트리(그룹)을 하나의 트리(그룹)으로 묶는 작업과, 두 정점이 같은 트리(그룹)에 속하는지 여부를 알 수 있는 작업 등 두개의 작업을 담당하는 자료구조임
6. Disjoint Set은 트리의 부모 자식 관계를 이용하여 구현할 수 있고, 두 트리(그룹)을 하나의 트리(그룹)로 묶을 때는 각 트리(그룹)의 대표 즉, 루트 노드를 이어 붙임
7. 그리고 두 정점이 같은 그룹인지 알고 싶을 때는 그 정점의 대표 즉, 루트 노드를 비교해봄으로써 알 수 있음
8. 따라서 크루스칼 알고리즘을 구현하기 위해서 간선의 가중치가 오름차순으로 정렬되어 있어야 하고, Disjoin Set 자료구조를 이용하여 사이클 여부를 판단해야 함
9. 한가지 Tip은 이제껏 그래프를 구현할 때 인접 행렬 혹은 인접 리스트로 구현해왔지만, 크루스칼 알고리즘의 경우는 간선에 관심이 있기 때문에 구조체로 시작점과 끝점, 그리고 가중치로 이루어진 구조체로 그래프를 구현하는 것이 구현에 있어 용이함
</pre>

```swift
//MARK: - Type
struct Edge {
    //MARK: - Property
    var p, q, cost: Int
    
    //MARK: - Initializer
    init(_ p: Int, _ q: Int, _ cost: Int) {
        self.p = p
        self.q = q
        self.cost = cost
    }
}

//MARK: - Variable
var parent: [Int] = []

//MARK: - Function
func find(_ x: Int) -> Int {
    if x == parent[x] {
        return x
    }
        
    let y: Int = find(parent[x])
    parent[x] = y
    
    return y
}

func unionFind(_ p: Int, _ q: Int) -> Bool {
    let rootP: Int = find(p)
    let rootQ: Int = find(q)
    
    if rootP == rootQ {
        return false
    }
        
    parent[rootP] = rootQ
    return true
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
        
    var result: Int = 0
    var edges: [Edge] = []
    parent = Array(repeating: 0, count: N + 10)
        
    for i in stride(from: 1, through: N, by: 1) {
        parent[i] = i
    }
        
    for _ in 0..<M {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
        let c: Int = inputData.map { Int($0) }[2] ?? 0
            
        edges.append(Edge(a, b, c))
    }
        
    //MARK: - Process
    edges.sort { $0.cost < $1.cost }
        
    for edge in edges {
        result += unionFind(edge.p, edge.q) ? edge.cost : 0
    }
        
    //MARK: - Output
    print(result)
}
```

### 35.2.2. 크루스칼 알고리즘과 다익스트라 알고리즘의 차이
<pre>
1. 다익스트라 알고리즘은 특정 노드에서 모든 노드로의 최단 거리를 위한 알고리즘이기 때문에, 결론적으로 그래프에서 최단 경로 트리를 구성하지만 시작점에 따라 그 경로가 달라질 수 있음. 따라서 무조건 최소 신장 트리를 만든다는 보장이 없음
2. 크루스칼 알고리즘은 그래프에서 모든 노드를 잇는 스패닝 트리 중 그 가중치의 합이 최소인 트리를 구하는 것이기 때문에, A에서 B까지의 최단 거리를 보장할 수는 없음. 따라서 두 알고리즘의 목적이 다름
</pre>

### 35.3. SCC(Strongly Connected Component)
<pre>
1. Connected Component : 무방향 그래프에서 연결되어 있는 그래프들의 그룹으로 나누는 것, DFS / BFS 즉, 그래프 순회로 Connected Component를 구할 수 있음(서로 연결되어 있는 그래프의 노드들이 누구인지, 그 그룹의 수가 몇 개인지 구할 수 있음)
2. Strongly Connected Component, SCC : 방향 그래프에서는 연결되어 있다 하더라도, 돌아오지 못하는 경우가 있을 수 있으므로 같은 그룹의 노드라면 오고갈 수 있는 경로가 있는 그룹끼리 나누는 것을 SCC라고 함
3. 위 SCC를 구하는(오고갈 수 있는 경로가 항상 존재하는 서로 연결되어 있는 그래프의 노드들이 누구인지, 그 그룹이 몇 개인지 구하는) 대표적인 알고리즘이 코사라주 알고리즘
</pre>

### 35.3.1. SCC - 코사라주 알고리즘(Kosaraju's Algorithm)
<pre>
1. 코사라주 알고리즘을 구현하기 앞서 메타 그래프에 대해 알아야 하는데, 현재 SCC를 안다고 할 때 SCC끼리 하나의 노드로 보는 그래프. 즉, Cycle이 없음
2. 따라서 메타 그래프에 대해 DFS 알고리즘을 2번 적용하게 되는데, 처음 DFS를 적용하면서 빠져나오는 노드의 번호를 차례로 저장하고
3. 위 과정을 거치고 난 후, 초기 그래프의 간선의 방향을 모두 바꾸게 되면 가장 나중에 빠져나온 노드 즉, 루트 노드가 속한 그룹이 메타 그래프의 단말 노드가 되는 것을 알 수 있음
4. 따라서 가장 나중에 빠져 나오는 노드 즉, 단말 노드이기 때문에 더이상 내려갈 곳이 없으므로 그 노드 부터 DFS를 한번 더 적용하기 위해서 간선의 방향이 반대인 그래프를 따로 저장할 필요가 있음
5. 간선의 방향이 반대인 그래프에 대해 가장 나중에 빠져 나온 단말 노드 부터 다시 한번 DFS를 적용하게 되면, SCC를 구할 수 있음(서로 오고갈 수 있는 경로가 존재하는 노드들끼리 이루어진 그래프와, 그 개수)
6. 따라서 코사라주 알고리즘은 DFS를 2번 적용한 알고리즘으로써 O(V + E) 시간복잡도를 가짐
</pre>

```swift
//MARK: - Type
struct Graph {
    //MARK: - Property
    var edges: [Int]
    
    //MARK: - Init
    init() {
        self.edges = []
    }
}

//MARK: - Variable
var graph: [Graph] = [], reverseGraph: [Graph] = []
var visited: [Bool] = []
var orders: [Int] = [], groups: [Int] = []
var orderCount: Int = 0, groupCount: Int = 0

//MARK: - Function
func graphDFS(_ x: Int) -> Void {
    visited[x] = true
    
    for i in 0..<graph[x].edges.count {
        let y: Int = graph[x].edges[i]
        
        if !visited[y] {
            graphDFS(y)
        }
    }
        
    orders[orderCount] = x
    orderCount += 1
}

func reverseGraphDFS(_ x: Int) -> Void {
    visited[x] = true
    groups[x] = groupCount
    
    for i in 0..<reverseGraph[x].edges.count {
        let y: Int = reverseGraph[x].edges[i]
        
        if !visited[y] {
            reverseGraphDFS(y)
        }
    }
}

func solution() -> Void {
    //MARK: - Input
    guard let input: [String] = readLine()?.components(separatedBy: " ") else { return }
    let N: Int = input.map { Int($0) }[0] ?? 0
    let M: Int = input.map { Int($0) }[1] ?? 0
    graph = Array(repeating: Graph(), count: N + 10)
    reverseGraph = Array(repeating: Graph(), count: N + 10)
    visited = Array(repeating: false, count: N + 10)
    orders = Array(repeating: 0, count: N + 10)
    groups = Array(repeating: 0, count: N + 10)
        
    for _ in 0..<M {
        guard let inputData: [String] = readLine()?.components(separatedBy: " ") else { return }
        let a: Int = inputData.map { Int($0) }[0] ?? 0
        let b: Int = inputData.map { Int($0) }[1] ?? 0
            
        graph[a].edges.append(b)
        reverseGraph[b].edges.append(a)
    }
        
    //MARK: - Process
    for i in stride(from: 1, through: N, by: 1) {
        if !visited[i] {
            graphDFS(i)
        }
    }
        
    visited = Array(repeating: false, count: N + 10)
        
    for i in stride(from: orderCount - 1, through: 0, by: -1) {
        if !visited[orders[i]] {
            reverseGraphDFS(orders[i])
            groupCount += 1
        }
    }
        
    //MARK: - Output
    print(groupCount)
}
```

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Graph%20Algorithm">=> 그래프 예제</a></pre>

<hr>
</hr>

### 36. 시뮬레이션(Simulation)
### 36.1. 시뮬레이션 개요
<pre>
1. Simulation 문제는 특정 알고리즘이 아닌, 주어진 조건에 맞추어 그 상황을 구현하는 문제
2. 따라서, 여러 알고리즘이 복합적으로 적용될 수 있어 Simulation 문제를 해결하는 능력을 기르는 것과 알고리즘 실력을 기리는 것은 같이 증가한다고 볼 수 있음
3. 큰 문제를 잘 나누어서 해결하는 것이 큰 전략이며, 문제를 잘 이해했는지 확인하기 위해 예제를 따라가 보는 것이 좋음
4. 문제의 Test Case가 이어져 있는 경우가 있고, 독립적인 경우가 있는데 이어져 있는 경우에는 값의 초기화를 잘 신경써야 함
5. 문제의 크기가 작다면 완전탐색이 가장 정확하고 안전한 방법이고, 문제의 크기가 크다면 완전탐색 외에 다른 방법을 적용하는 것이 바람직함
</pre>

### 36.2. 시뮬레이션 문제 풀이 Tip
<pre>
1. 2차원 배열에서 상, 하, 좌, 우를 이동해야할 때, dx = {0, 0, 1, -1}, dy = {1, -1, 0, 0} 처럼
2. 방향에 대한 배열을 만들어놓고 이를 참조하여 이동하는 것이 코드를 더 간결하게 작성할 수 있음
3. 또, 2차원 배열에서 상하좌우 이동시 배열의 경계(index를 벗어나는 경우)에 대해 효율적으로 처리하는 방법은
4. 배열의 크기를 원래 배열보다 더 크게 잡아 주변을 장애물로 만들어주고, 장애물 처리를 하면 됨 -> 메모리 참조 오류 방지
5. 장애물 처리는 임시 변수를 만들어 먼저 해당 칸에 가보고, 갈 수 있으면 이동하고 갈 수 없으면 멈추는 알고리즘을 적용할 수 있음
6. 결국, 복잡한 문제에대해 단위 단위 별로 나누어서 단위 문제를 해결하고 합쳐서 최종 문제를 해결하면, 보다 수월하게 Simulation 문제를 해결할 수 있음
</pre>

### 36.3. 시뮬레이션 문제 풀이 Tip2
<pre>
1. 반복적으로 재사용 될 수 있는 코드는 함수로 모듈화 시키는 것이 좋음
2. 경계처리 알고리즘에서 여유있게 공간을 할당한 부분은 정답에 영향을 끼치지 않는 값으로 초기화 해야 함
</pre>

</br>

<pre><a href="https://youngjaelee-dev.tistory.com/category/Swift%20Data%20Structure%20And%20Algorithm/Simulation">=> 시뮬레이션(Simulation) 예제</a></pre>

<hr>
</hr>
