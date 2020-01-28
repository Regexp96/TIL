# python os.py

sys.builtin_module_names 를 실행시키면 임포트 된 모듈들이 나오는데 거기서

if 'posix' in _names: 또는 if 'nt' in _names:를 이용해 커널 종류를 파악한다

커널의 종류를 먼저 파악하는 이유 :

- 개행문자가 다름
  - 유닉스는 \n 윈도우는 \r\n
- 경로구분자가 다름
  - 유닉스는 \ 윈도우는 ₩
  - 기본적인 파일시스템 자체가 다르다
    - os.path()를 하면 ntpath 와 posixpath로 나눠서 실행됨

## makedirs()

mkdir과 같은 동작을 하는 명령어

경로가 들어오면 경로에 마지막에 / 가 있는지 확인하고 있으면 /를 제거

같은 이름의 폴더가 있는지 검사후 Module/clinic/posixmodule.c.h의 os_mkdir를 호출해 디랙토리 생성