## JuiceMaker의 쥬스가게

![Apr-03-2021 00-28-30](https://user-images.githubusercontent.com/64566207/113429755-04758700-9414-11eb-8a21-acd460bd224f.gif)

![Apr-03-2021 00-28-36](https://user-images.githubusercontent.com/64566207/113429787-0ccdc200-9414-11eb-8407-0379346a839e.gif)

📅 과제 진행 기간 : 2021-03-08 ~ 2021-03-19

📕 Description : 여러가지 쥬스를 주문할 수 있으며, 재고 관리까지 수행할 수 있는 App

📗 이 프로젝트를 통해서 학습한 내용

- SingleTon을 통한 타입 사용
- enum의 연산프로퍼티 사용
- 읽기전용 프로퍼티 사용(은닉화, 캡슐화 개념)
- 예외처리(throws, do-catch-try)사용
- Dynamic Dispatch를 최소화 하기 위한 final 사용
- stepper 사용
- Dictionary 사용
- struct vs class

🛠  Refactoring 일정

- 03-21 : Step2 메이슨 피드백 refactoring 진행

- 04-02 : AutoLayout 구현, Step3 구현

⚒️ 피드백 및 Refactoring 상세 내용

- struct, class, enum의 특징을 정확히 파악해서 타입을 정의해라

- Dictionary 로 구성하던 과일 재고를 struct 로 변경 ( struct, class로 구성해야 이후 특성을 추가할 수 있음 )

- naming 개선 ( 이름만 보고도 해당 프로퍼티, 메서드의 역할을 알 수 있도록 변경 )

- private를 통한 은닉화, final 추가를 통한 최적화

- 하드코딩 제거함으로써 유지보수시에 용이할 수 있도록 변경

🤔 조금 더 고민할 점

- extension을 통한 메서드, 프로퍼티 추가와 상속을 통한 커스텀 각각의 장단점에 대해서 생각해보자

- 코드를 통한 UI 구성을 어떻게 할 수 있는가?

🔑 관련 TIL 링크

[21.03.08](https://velog.io/@leeyoungwoozz/TIL-2021.03.09-Mon) - UML 작성 및 설계

[21.03.09](https://velog.io/@leeyoungwoozz/TIL-2021.03.10-Wed) - optional, error, CustomStringConvertible 학습

[21.03.11](https://velog.io/@leeyoungwoozz/TIL-2021.03.11-Thu) - struct vs class 에 대한 고찰

[21.03.12](https://velog.io/@leeyoungwoozz/TIL-2021.03.14-Fri) - 디자인패턴(SingleTon) 학습

[21.03.15](https://velog.io/@leeyoungwoozz/TIL-2021.03.15-Mon) - Dynamic Dispatch 학습

[21.03.16](https://velog.io/@leeyoungwoozz/TIL-2021.03.16-Tue) - View 레이아웃 LifeCycle 학습1

[21.03.19](https://velog.io/@leeyoungwoozz/TIL-2021.03.19-Fri) - View 레이아웃 LifeCycle 학습2
