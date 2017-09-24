### Chapter2. Springs
- 기본적으로 스피링 애니메이션을 줄 수 있는 고수준의 API를 제공함.
```Swift
UIView.animate(withDuration: 0.5, delay: 0.5,
usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [],
animations: {
    self.loginButton.center.y -= 30.0
    self.loginButton.alpha = 1.0
}, completion: nil)
```
- usingSpringWithDamping : 최종상태에 가까워지면서 적용되는 감소량. 0에 가까울수록 탄력성이 높음
- initialSpringVelocity : 애니메이션의 초기 속도제어

*Note
- 스프링 애니메이션의 경우 적용한 모든 속성(alpha 등등)에 영향을 줄 수 있음.

### Chatper3. Transitions
- 뷰의 추가 및 제거 시 애니메이션
- 미리 정의된 애니메이션은 뷰의 시작 및 끝을 보관하지 않음.

- 뷰의 계층이 변할때 애니메이션을 주고자 할때에는 transition을 이용.
- 뷰를 addSubView, removeFromSuperView 할 경우 그 상위으 뷰가 컨테이너 역할을 함.
- 뷰를 hidden시키는 경우에는 그 자신이 컨테이너 역할을 함.
- 하나의 뷰에서 다른 뷰로 체인지 하고 싶을 경우에는 아래를 사용
```Swift
- UIView.transition(from: oldView, to: newView, duration: 0.33,
options: .transitionFlipFromTop, completion: nil)
```

### Chapter4. View Animations in Practice
**이장은 연습임… 한번 꼭 해보는게 좋은듯… 큐브랑 여러 애니메이션 구현하는 거 나옴.**

### Chatper5. Keyframe animations
- 기본 애니메이션 api의 경우 두개의 애니메이션을 묶는데는 효과적이지만 여러개 단위로 묶어야 할 경우 어려움이 있음. 이를 해결해주는게 KeyframeAnimation임.
- addKeyframe api는 상대적 지속시간을 사용. (0.1 -> 10%, 0.25 -> 25%)
- animateKeyframes api 내부에 addKeyFrame 애니메이션 블럭을 넣는 순으로 작성함.
```Swift
UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [.calculationModeCubic],
animations: {
    //add keyframes
    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25,
    animations: {
        self.planeImage.center.x += 80.0
        self.planeImage.center.y -= 10.0
        }
    )

    UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.4) {
        self.planeImage.transform = CGAffineTransform(rotationAngle: -.pi / 8)
    }

    UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
        self.planeImage.center.x += 100.0
        self.planeImage.center.y -= 50.0
        self.planeImage.alpha = 0.0
    }

    UIView.addKeyframe(withRelativeStartTime: 0.51, relativeDuration: 0.01) {
        self.planeImage.transform = .identity
        self.planeImage.center = CGPoint(x: 0.0, y: originalCenter.y)
    }

    UIView.addKeyframe(withRelativeStartTime: 0.55, relativeDuration: 0.45) {
        self.planeImage.alpha = 1.0
        self.planeImage.center = originalCenter
    }
    },
    completion: nil
    )
}
```

*Note
- keyframe animation의 경우 기본 제공되는 easing curves를 제공하지 않음. 이는 의도적임. 키프레임의 경우 특정 시간에 시작되고 완료되며 서로에게 유입이 되는데 각각 easing이 들어갈 경우 부드럽게 이어지는 동작을 어지럽힐 수 있기 때문임.
- easing을 지원하지 않는 대신 여러가지 계산 모드를 제공함. 각 모드는 애니메이션의 중간 프레임을 계산하는 다른 방법과 원활한 이동 및 페이싱을 위한 다양한 옵티마이저를 제공함. (UIViewKeyframeAnimamtionOptions) -> 이부분은 좀 더 찾아봐야 할듯.

### Chapter6. Introduction to AutoLayout
// 그냥 오토레이아웃 설명임…

### Chapter7. Animating Constraints
- 오토레이아웃이 제대로 작동하려면 frame, center같은 속성으로 애니메이션을 만들 수 없음
-

