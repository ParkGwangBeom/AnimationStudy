# Section4 뷰컨트롤러 트랜지션

## 17장 뷰컨트롤러 트랜지션

**전환 방식**

ViewController에서 Transition delegate 메소드의 구현 여부를 통해서 animation관련 객체 즉 UIViewControllerAnimatedTransitioning값을 받고 이를 통해서 전환 효과를 구현함

<img src="https://github.com/ParkGwangBeom/AnimationStudy/blob/master/ViewControllerTransition/Resource/trans1.png"/>

UIKit은 animationController (forPresented : presenting : source :)를 호출하여 UIViewControllerAnimatedTransitioning이 반환되는지 확인함
이 반환값이 nil이면 기본 제공 전환을 사용
반환값이 존재하면 이것을 전환을 위해서 사용함

animateTransition (:)을 사용하면 화면의 현재 뷰컨트롤러뿐 아니라 새로운 뷰컨트롤러에 접근할수 있으며 이를 통해서 애니메이션을 조작할 수 있음.


UIViewControllerContextTransitioning는 전환의 매개변수와 보기 컨트롤러에 대한 접근을 제공함. 이를 통해서 이전뷰컨, 다음뷰컨, 뷰등에 접근이 가능함. 또한 이는 update, finish상태를 업데이틑 함수를 제공함.

뷰컨트롤러간 전환이 시작되면 기존 뷰가 전환 컨테이너뷰에 추가되고 새뷰컨트롤러가 생성됨. 하지만 새 뷰컨트롤러는 보이지 않음

UIViewControllerContextTransitioning
- view(forKey:) - 이전 및 새로운 뷰 컨트롤러 뷰에 접근할수 있음
- viewController(forKey:) - 이전 및 새로운 뷰컨트롤러에 접근할수 있음

viewWillTransition은 기기 방향 변경을 처리하는 방법을 제공함
- size: 전환될 뷰의 크기
- coordinator: 전환 좌표의 개체에 대한 접근을 제공함


## 18장 네비게이션 컨트롤러 커스텀 트랜지션

- UIViewTransion과 비슷한방법으로 delegate를 통해서 정해진 값을 가져와 처리하는 형식임
- UINavigationControllerOperation은 push pop 형태를 알려줌

네비게이션 컨트롤러에서 커스텀 전환을 구현하기 위해서는
```
navigationController(_
navigationController: UINavigationController,
animationControllerFor
operation: UINavigationControllerOperation,
from fromVC: UIViewController,
to toVC: UIViewController) ->
UIViewControllerAnimatedTransitioning?
```
메소드를 이용함. 이는
animationController (forPresented : presenting : source :)와 동일하게 UIViewControllerAnimatedTransitioning객체를 반환함


## 19장 Interactive UINavigationController Transitions

Interactive controller의 전환은 UIViewControllerAnimatedTransitioning와 UIViewControllerInteractiveTransitioning 프로토콜을 따라야함

UIViewControllerInteractiveTransitioning
- startInteractiveTransition: 시작 부분
- updateInteractiveTransition: 업데이트 되는 부분

UIPercentDrivenInteractiveTransition는 클래스임. 이는 UIViewControllerInteractiveTransitioning를 따름.
이는 좀 더 Interactive 전환 효과에 대해 좀 더 편하게 관리할수 있도록 해줌

<img src="https://github.com/ParkGwangBeom/AnimationStudy/blob/master/ViewControllerTransition/Resource/trans2.png"/>

사용자가 애매한상태에서 전환효과를 종료했을 때가 있음. 이때 전환에 문제가 생길수 있음.  UIPercentDrivenInteractiveTransition는 그를 해결해줌. 이를 통해서 전환을 되돌리거나 완료할수 있음. cancel()과 finish()

<img src="https://github.com/ParkGwangBeom/AnimationStudy/blob/master/ViewControllerTransition/Resource/trans3.png"/>
