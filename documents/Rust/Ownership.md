# Rust의 소유권

> 1. 러스트의 각각의 값은 해당값의 *오너*(*owner*)라고 불리우는 변수를 갖고 있다.
> 2. 한번에 딱 하나의 오너만 존재할 수 있다.
> 3. 오너가 스코프 밖으로 벗어나는 때, 값은 버려진다(dropped).

러스트는 가비지 컬랙션 없는 메모리 관리를 위하여 소유권이라는 개념을 만들었다.

소유권에서 가장 중요한건 **이동(move)** 인데 이 이동의 개념을 한마디로 설명하면

**앝은 복사시 이전에 존재하였던 값은 소멸된다.** 라고 말할수있다.

~~~rust
let s1 = String::from("hello");
let s2 = s1;

println!("{}, world!", s1);
~~~

이 코드는 다음과 같은 에러를 발생시킨다.

~~~
error[E0382]: use of moved value: `s1`
 --> src/main.rs:4:27
  |
3 |     let s2 = s1;
  |         -- value moved here
4 |     println!("{}, world!", s1);
  |                            ^^ value used here after move
  |
  = note: move occurs because `s1` has type `std::string::String`,
which does not implement the `Copy` trait
~~~

다른 언어들이라면 가비지 컬랙터가 s1이 필요없어지는 시기에 알아서 s1을 할당 해제해주겠지만 러스트는 s1값을 무효화 시킴으로써 해결한다.

따라서 s1은 2번째줄이 끝나는 순간 무효화 되어 3번째 라인에서 에러가 발생한것이다.

그렇다면 깊은 복사의 경우는 어떠할까?

러스트는 자동으로 깊은복사를 지원하지 않는다 대산 clone이라는 메소드를 사용하여 깊은복사를 지원할수있다.

~~~rust
let s1 = String::from("hello");
let s2 = s1.clone();

println!("s1 = {}, s2 = {}", s1, s2);
~~~

# 레퍼런스

소유권의 이동을 배우면 궁금해지는것이 하나 있다 

'함수에 인자로 값을 넘기면서 소유권은 그대로 유지하는 방법은 없는걸까?'

위 질문에 대한 해답은 **참조(Reference)** 다 

참조란 c언어를 했으면 기억날 포인터와 거의 같은 개념이다. 

~~~rust
fn main() {
    let s1 = String::from("hello");

    let len = calculate_length(&s1);

    println!("The length of '{}' is {}.", s1, len);
}

fn calculate_length(s: &String) -> usize {
    s.len()
}
~~~

여기서 중요한점은 변수가 기본적으로 불변이듯 참조자도 기본적으로 불변이다

## 가변참조자

~~~rust
fn main() {
    let mut s = String::from("hello");

    change(&mut s);
}

fn change(some_string: &mut String) {
    some_string.push_str(", world");
}
~~~

위와같이 &mut 키워드를 통해 가변 참조자를 생성할수있다 하지만 가변참조자는 한가지 큰 제약이 있는데 그건 바로 하나의 데이터 조각에 딱 하나의 가변참조자만을 허용한다는것이다.

이런 불편한 규칙을 만든 이유는 데이터 레이스를 방지하기 위해서인데 데이터레이스란

*코드가 멀티스레드로 구동되고 두 쓰레드가 같은 데이터 값을 변경하려 할때 생기는 문제점* 이다.

데이터 레이스는 3가지 동작이 발생했을때 나타나는데 이 조건은

1. 두 개 이상의 포인터가 동시에 같은 데이터에 접근한다.
2. 그 중 적어도 하나의 포인터가 데이터를 쓴다.
3. 데이터에 접근하는데 동기화를 하는 어떠한 메커니즘도 없다.

러스트에서 여러개의 가변참조자를 만들려고 하면 새로운 스코프를 만들어 해결하면 된다 -> 즉 중괄호로 스코프를 구분해서 *동시에* 가변참조자를 만드는게 아니게 해주면 된다

~~~rust

let mut s = String::from("hello");

{
    let r1 = &mut s;

} // 여기서 r1은 스코프 밖으로 벗어났으므로, 우리는 아무 문제 없이 새로운 참조자를 만들 수 있습니다.

let r2 = &mut s;
~~~

## 슬라이스

소유권을 갖지않는 또 다른 데이터 타입으로 스트링이나 배열등을 잘라내 표현한것이다

~~~rust
let s = String::from("hello world");

let hello = &s[0..5];
let world = &s[6..11];
~~~

위와같은 코드의 경우 hello는 0부터 시작하고 길이가 11인 포인터, world는 6부터 시작하고 길이가 5인 포인터로 이루어진다.

~~~rust
let s = "Hello, world!";
~~~

여기서 s의 타입은 &str이다. 이는 어느 특정지점을 가지고 있는 슬라이스이기때문에 불변이다.

이래서 string 과 &str의 함수가 다른것.

다른 배열같은 타입도 슬라이스타입이 존재한다.

~~~rust
let a = [1, 2, 3, 4, 5];

let slice = &a[1..3];
~~~

이 슬라이스는 &[i32] 타입을 갖는다.