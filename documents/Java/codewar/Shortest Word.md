# Shortest Word

## 내 코드

~~~java
import java.util.StringTokenizer;

public class Kata {
    public static int findShort(String s) {
        // 스페이스로 토큰분리후 길이비교해서 변수저장
        int maxlength = 0;
        StringTokenizer token = new StringTokenizer(s," ");
        while(token.hasMoreTokens()) {
        String next = token.nextToken();
          if(maxlength == 0) maxlength = next.length();
          else if (maxlength > next.length()){
            maxlength = next.length();
          }
        }
        return maxlength;
    }
}
~~~

StringTokenizer를 이용해 문자를 분리한 뒤 각 문자의 길이를 비교후 저장

처음에 nextToken으로 바로 비교를 했는데 이러니까 else if 부분에서 하나를 건너뛰고 검사하는 오류 발생 ->  nextToken을 저장하는 변수 생성으로 해결

## 추천수 1위 코드

~~~java
import java.util.stream.*;
public class Kata {
    public static int findShort(String s) {
        return Stream.of(s.split(" "))
          .mapToInt(String::length)
          .min()
          .getAsInt();
    }
}
~~~

스트림을 이용하여 문제를 해결

문자열을 공백으로 분리 후 mapToInt를 통해 intStream으로 바꿔준 후 최소값을 뽑아내 리턴함

스트림에대한 공부를 해봐야겠음