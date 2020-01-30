# oh-my-zsh git alias

Oh-my-zsh에는 수많은 단축어(alias)가 있고 그중 git에 관련된 단축어만 150개 가량 된다 

이중 개인적으로 많이 쓰는명령어 몇개만 정리해볼까한다.

~~~shell
ga = 'git add'
gc ='git commit -v'
gcam ='git commit -a -m'
gcb ='git checkout -b'
gcm ='git checkout master'
gba ='git branch -a'
gd ='git diff'
gm ='git merge'
gp ='git push'
gup ='git pull --rebase'
~~~

구조가 꽤나 단순하여 외우기 편할것같다.

Oh-my-zsh를 사용중이면서 다른 git 관련 단축어를 보고싶다면 터미널에 다음 명령어를 입력하면 알수있다.

~~~shell
alias | grep git
~~~