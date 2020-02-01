# Array.diff

## 답

retain을 이용하면 된다는 힌트까지는 얻었으나 그 뒤 인자에 들어갈 트레잇을 몰라서 못풀었다 

러스트 트레잇 공부 필요

원했던 답은 다음과 같다.

```rust
fn array_diff<T: PartialEq>(a: Vec<T>, b: Vec<T>) -> Vec<T> {
    let mut a = a;
    a.retain(|x| !b.contains(x));
    a
}
```

