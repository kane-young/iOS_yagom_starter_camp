## 숫자 야구게임

📅 과제 진행 기간 : 2021-02-22 ~ 2021-02-26

📕 Description : 우리가 어릴 때 많이 해 본 숫자 야구게임을 컴퓨터와 진행한다.



console app 결과 출력

<img width="300" src="https://user-images.githubusercontent.com/64566207/110202414-bb312680-7eab-11eb-9cb5-b4b8d65ef742.png">



프로젝트를 통해서 학습한 내용

- enum 과 Error 프로토콜을 활용한 Error 검출
- 컬렉션 타입의 차이 (Set, Array)
- Swift API Design Guidelines를 참고한 함수명, 변수명
- 공식문서에서 사용되는 들여쓰기 기준
- 가독성있게 코드를 작성하는 방법
- exit에 대한 애플측의 [Technical Q&A](https://www.notion.so/yagomacademy/TIL-2021-03-05-Fri-9aba1d8dfd5c4f409989114945035eef#16d697f58f8c4c4eb6579caf8f022895)



1차 Refactoring

- 빈 Array에 subscript로 원소를 접근하면 런타임 에러가 발생한다. 

  => Subscript로 접근하기 전에 아이템이 존재하는지를 먼저 검사해주고 접근하면 런타임 에러를 방지할 수 있다.

- 관심사 분리를 통한 모듈 분리

- 이중 for문을 제거하고 contain 함수를 통한 가독성 증가

  => 여전히 contain 함수가 순회여서 O(n)을 가져 이중 반복이라 O(n^2)이긴 하다.

  함수가 깊어지는 문제는 해결하였다.



2차 Refactoring

- 입력 값을 Set 으로 타입 캐스팅하여서 중복되는 값이 들어오는지 검사할 수 있도록 함.

관련 TIL, TWL 링크

[02.24 - TIL](https://velog.io/@leeyoungwoozz/TIL-2021.02.24-Tue)

[02.25 - TIL](https://velog.io/@leeyoungwoozz/TIL-2021.02.26-Thu)

[02.26 - TIL](https://velog.io/@leeyoungwoozz/TIL-2021.02.26-Fri)

[02.23 - 02.26](https://velog.io/@leeyoungwoozz/TWL-2021.02.23-2021.02.26)

