# Vowel Count

## 내 코드

~~~java
public class Vowels {

  public static int getCount(String str) {
    int vowelsCount = 0;
    for(char ch : str.toCharArray()){
      if (ch == 'a'||ch == 'e'||ch == 'i'||ch == 'o'||ch == 'u'){
        vowelsCount++;
      }
    }
    return vowelsCount;
  }
}
~~~

str.toCharArray() 를 통해 배열로 만들어진 문자열을 for each문을 통해 하나씩 더하는 방식

## 다른방법 

~~~ java
public class Vowels {
    public static int getCount(String str) {
        return str.replaceAll("(?i)[^aeiou]", "").length();
    }
}
~~~

(?i)를 이용해 대소문자 구분을 안하고 뒤의 정규식  \[^aeiou]를 이용해 aeiou를 제외한 문자들을 전부 없엔후 그 길이를 리턴

