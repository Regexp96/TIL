# String 정리

- toCharArray 함수를 이용하여 char 타입 배열로 만들어 for each문 사용가능

  다음은 해당 기능을 사용한 모음 갯수를 출력하는 코드의 일부이다

  ~~~java
  for(char ch : str.toCharArray()){
  if (ch == 'a'||ch == 'e'||ch == 'i'||ch == 'o'||ch == 'u'){vowelsCount++;}}
  ~~~

- replaceFirst() / replaceAll() 함수를 사용할때 대소문자 구분을 없에려면 정규식 앞에 (?i)를 넣어주면 된다.

  ~~~java
  str.replaceAll("(?i)[^aeiou]", "")
  ~~~

  