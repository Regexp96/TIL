# awk

awk는 파일의 공백, 탭을 구분자로 레코드를 만들어서 선택된 레코드의 값을 조작하거나 데이터화 하는 프로그램이다.![awk](/Users/gyuseokjung/Documents/TIL/images/awk.png)

다음 그림과 같이 동작한다.

## 명령어 옵션

```
awk [OPTION...] [awk program] [ARGUMENT...]
      OPTION
        -F        : 필드 구분 문자 지정.
        -f        : awk program 파일 경로 지정.
        -v        : awk program에서 사용될 특정 variable값 지정.
      awk program
        -f 옵션이 사용되지 않은 경우, awk가 실행할 awk program 코드 지정.
      ARGUMENT
        입력 파일 지정 또는 variable 값 지정.
```

[출처](https://recipes4dev.tistory.com/171)

## 예시

~~~
length($0) > 72
              Print lines longer than 72 characters.
{ print $2, $1 }
              Print first two fields in opposite order.

BEGIN { FS = ",[ \t]*|[ \t]+" }
      { print $2, $1 }
        Same, with input fields separated by comma and/or blanks and tabs.

     { s += $1 }
END  { print "sum is", s, " average is", s/NR }
       Add up first column, print sum and average.

/start/, /stop/
      Print all lines between start/stop pairs.

BEGIN     {    # Simulate echo(1)
     for (i = 1; i < ARGC; i++) printf "%s ", ARGV[i]
     printf "\n"
     exit }
~~~

## 응용

로그인을 성공한 ip를 확인하기

ip 와 성공한 서비스를 확인

`cat /var/log/auth* | grep Accepted | awk '{print $11"\t"$14}'`

