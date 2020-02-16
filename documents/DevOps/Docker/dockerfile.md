# Dockerfile

docker 이미지 설정파일

~~~dockerfile
FROM ubuntu:14.04
MAINTAINER Foo Bar <foo@bar.com>

RUN apt-get update
RUN apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/lib/nginx

VOLUME ["/data", "/etc/nginx/site-enabled", "/var/log/nginx"]

WORKDIR /etc/nginx

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
~~~

- from : 기반 이미지 설정 위 예제에서는 우분투 14:04버전 이용
- run : 쉘스크립트 실행
  - 이미지 생성중에는 사용자입력을 받을 수 없음
  - 설정값 변경시 sed 명령어로 문자열 변경해야함 
- volune : 공유할 폴더명 -v 옵션과 동일
- cmd : 컨테이너가 실행되었을 때 실행될 파일
- expose : 호스트와 연결 될 포트번호
- workdir : cmd에서 실행될 명령이 실행될 폴더 위치

## 실행

~~~shell
docker build <dockerfile 경로>
~~~

--tag 옵션으로 이름 지정 가능

~~~shell
docker run --name hello-nginx -d -p 80:80 -v /root/data:/data <docker 파일 태그명>
~~~

방금 만든 도커 파일로 생성된 이미지를 hello-nginx라는 이름으로 80번포트를 열어서 접속함 /root/data/ 폴더를 컨테이너안의 /data와 공유함

