
## 묵찌빠 게임

📅 과제 진행 기간 : 2021-03-01 ~ 2021-03-07

📕 Description : 가위 바위 보를 실시하고 이어서 묵찌빠를 진행한다.



console app 결과 출력

<img width="300" src="https://user-images.githubusercontent.com/64566207/110244422-f4e45900-7fa1-11eb-976f-7f9c46a45cd6.png">



프로젝트를 통해서 학습한 내용

- enum에서 활용 가능한 여러 프로토콜(CaseIterable, CustomStringConvertible, Comparable)
- Swift API Design Guidelines의 상세한 변수명, 함수명, 상수명 규칙
- 가독성있게 코드를 작성하는 방법
- 하드코딩의 단점
  - 유지 보수시에 일일이 코드를 수정해야 한다는 점에서 비효율
  - 코드 가독성이 매우 떨어진다(해당 값이 어떤 값인지 알 수 없음)



1차 Refactoring

- 열거형에서 case로 해당 열거형과 확실하지 않은 값은 제외하고 다시 로직을 구현한다.

  => 코드를 나중에 유지보수 하는 입장에서 해당 case가 혼란을 일으킬 수 있기 때문에

- 메서드명을 동사형으로 시작하게 함으로써 직관적으로 변경

- CaseIterable 프로토콜 추가함으로써 random 값 직관적으로 변경

  => 하드코드 수정

- 메서드명에서 get 제거 ( 참고 : https://awesomeopensource.com/project/StyleShare/swift-style-guide#줄바꿈 )



2차 Refactoring

- 타입명은 대문자 카멜케이스 준수하도록 변경

- CustomStringConvertible 프로토콜 사용하여 rawValue 가 아닌 타입 자체를 활용함

- 중복되어서 비효율적인 로직 제거

- API Design Guidelines 에 준수하지 못한 이름 변경

  - Bool 타입 = is + 과거분사, is + 형용사
  - 메서드의 역할에 따른 return 값 변경

  

관련 TIL, TWL 링크

[03.01 - TIL](https://velog.io/@leeyoungwoozz/TIL-2021.03.01-Mon)

[03.02 - TIL](https://velog.io/@leeyoungwoozz/TIL-2021.03.02-Tue)

[03.04 - TIL](https://velog.io/@leeyoungwoozz/TIL-2021.03.04-Thu)

