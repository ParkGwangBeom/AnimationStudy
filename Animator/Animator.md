# Section5 UIViewPropertyAnimator

### 20. Getting Started with UIViewPropertyAnimator

- ios 10부터 지원되는 UIAnimator은 기존 UIView.animation.. 에서 할 수 없었던 취소, 되돌아가기 등을 구현할 수 있음.
- delayFactor는 절대 값을 초 단위로 제공하지 않음. 0.0~1.0 사이 값을 가짐
- 실제 지연을 초 단위로 파악하기 위해서는 delayFactor를 사용하여 애니메이터의 남은 기간을 곱하면됨.
```
delayFactor(0.33) * remainingDuration(=duration 0.33) = delay of 0.11 seconds
```
// 이미지

- 완료를 알고 싶을 경우 addCompletion 블럭을 추가해주면됨.
- 이는 또한 addAnimations와 같이 여러개를 추가할수 있음. 이는 차례대로 하나씩 실행이 됨.

### 21. Intermediate Animations with UIViewPropertyAnimator

- 주로 TimingFuction에 대한 얘기들…
- UIViewPropertyAnimator는 Custom TimingFunction을 쉽게 조작할수 있음.
- UIPropertyAnimator는 또한 기본적으로 spring animation이 제공됨. timingParameters는 UITimingCurveProvider 프로토콜 유형임.
- 이는 UICubicTimingParameters와 UISpringTimingParameters라는 두 클래스가 있음. 이를 통해서 cubic이나 spring 애니메이션의 타이밍을 커스텀하여 만들 수 있음

- 기본적으로 오토레이아웃 관련 애니메이션을 줄 때 constraint값을 변경하고 layoutifneed를 호출하여 변경하였음.
- tableview이  cell들의 높이를 묻고 필요에 따라 레이아웃을 변경할 때 애니메이션을 주고 싶을 경우 tableView의 beginUpdates(), endUpdates()를 호출하면됨.

### 22. Interactive Animations with UIViewPropertyAnimator

- UIView.animation…은 원하는 최종상태가 정의 되면 렌더링을 위해 애니메이션이 전송되고 컨트롤할수 없게됨.
- 하지만 UIViewPropertyAnimator는 시작, 중지, 속도변경등의 상호 작용을 할수 있음.
- UIViewPropertyAnimator는 애니메이션의 현재 상태에 대한 정보를 제공함.
//. 이미지

- state
    - inactive는 비활성화 상태를 얘기하며 animator가 생성만되고 아무것도 실행하지 않은 상태를 말함. 이는 isRunning을 false로 설정하는 것과는 별개임. isRunning의 경우 실제로 재생되는 애니메이션에만 관련이 있음.

// 이미지
- 애니메이션이 자연스럽게 완료가 되면 상태가 다시 inactive 상태로 변경됨

- 이미지와 같이 비활성화 상태에서 stopped상태로 변경이 불가능함.
- fractionComplete를 통해서 애니메이션의 interaction를 설정함. 이를 통해서 대화형 애니메이션을 줄수 있음.
- 아마 이는 코어애니메이션의 timeOffset을 설정한듯.
- fractionComplete의 경우 0과 1이 되었을 때 애니메이터가 완료됨. 그러므로 이를 제어하기 위해서는 0.01 ~ 0.99로 범위를 지정함.

- stopAnimation은 파라미터의 flag에 따라 달라짐
    - false 애니메이션을 정지상태로 만들며 finishAnimation을 호출할때까지 기다림.
    - true 완료 블럭을 호출하지 않고 모든 애니메이션을 지우고 비활성화 상태로 만듬.

- finishAnimation(at:) 은 파라미터에 따라 동작이 달라지며 completionBlock에서 불려질 position 값이 변경됨
    - start의 경우 애니메이션의 초기 값으로 돌아감
    - current의 경우 바뀐값을 유지함

pauseAnimation: startAnimation을 부를수 있음. 그대로 포즈하는것일뿐임

### 23. UIViewPropertyAnimator View Controller Transitions

- iOS 10부터 UIViewControllerAnimatedTransitioning에는 interruptibleAnimator(:)를 제공함. 이는 전환애니메이션에 사용할 중단 가능한 애니메이터를 제공할 수 있도록 도와줌

// 이미지

- 대화형의 경우 interruptibleAnimator를 사용하여 이용하게됨.
- wantsInteractiveStart 속성을 통해서 대화형 비대화형 설정이 가능함
