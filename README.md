
# Python language sample - sin()

EDISON 시뮬레이션 SW 개발자를 위한 1개의 입력 파일 읽어, sin 그래프를 그리는 python언어 예제 파일입니다.

```
README.md
bin
  - main.py     //main 소스 코드
inp
  - input.dat	//sample input file
=======
```


다음 수식의 변수들을 입력으로 받으며, 입력 변수는 a,b,c,d 총 4개 입니다.

$$
y = a * sin(bx-c)+d
$$


입력 파일의 경우에는 변수와 값 구분자를 ' '을 사용하였으며, 변수와 변수 사이를 구분하기 위해 ' ;\n '를 사용하였습니다. 파일로 입력을 받으며, 샘플 입력 파일은 아래와 같으며, **inp** 폴더에 **input.dat** 로 저장되어 있습니다.

```
a 1
b 0.4
c -0.5
d 0.3
```

본 예제는 ./[실행파일명] -[옵션] [입력 파일 경로]로 실행시 옵션 뒤에 입력된 경로의 파일을 열고 닫는 예제는 **bin** 폴더에 main.py 파일을 바로 실행합니다.


## 설치하기

zip 파일을 다운로드 받아 압축을 풀거나 ```git clone``` 명령어를 이용하여, 프로젝트를 가져올 수 있습니다.

```
$ git clone https://github.com/sp-edison/python_example_onedplot.git
```

다운로드가 완료되면, ```python_example_onedplot``` 폴더가 생성되며, **bin** 폴더로 이동해  아래와 같이 명령어를 입력하면 실행이 됩니다.

```
$ cd ../bin
$ ./main.py -i ../inp/input.dat
```
