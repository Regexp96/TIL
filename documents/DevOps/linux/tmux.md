# Tmux

## 설명

tmux는 사용자가 단일 단말기 창 또는 원격 터미널 세션 안에서 여러 별도의 터미널 세션에 액세스할 수 있도록 여러 가상 콘솔을 다중화하는데 사용할 수 있는 응용 소프트웨어이다

## 구성

- session : tmux 실행 단위. 여러개의 window로 구성.
- window : 터미널 화면. 세션 내에서 탭처럼 사용할 수 있음.
- pane : 하나의 window 내에서 화면 분할.
- status bar : 화면 아래 표시되는 상태 막대.

## 명령어

새 세션 생성

  tmux new -s <session-name>

세션 이름 수정

 ctrl + b, $

세션 종료

exit

세션 중단하기 (detached)

 ctrl + b, d

세션 목록 보기 (list-session)

tmux ls

세션 다시 시작

tmux attach -t <session-number or session-name>