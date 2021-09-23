## Swift5 N x M 크기의 2차원 배열 생성 방법
<pre>
    let array: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
</pre>

## Swift5 for문 거꾸로 순회하는 방법
<pre>
    1. 마지막 순서를 포함하지 않는 경우 - for i in stride(from: 5, to: 0, by: -1) // 5, 4, 3, 2, 1
    2. 마지막 순서를 포함하는 경우 - for i in stride(from: 5, through: 0, by: -1) // 5, 4, 3, 2, 1, 0
</pre>
