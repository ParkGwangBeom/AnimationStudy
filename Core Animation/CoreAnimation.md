
# Section 3 Core Animation
- 레이어는 이미지 기반 콘텐츠를 나타내는 여러 속성을 제공하는 간단한 모델 클래스임.

## Getting Started with Layer Animations
- 레이어 애니메이션은 정의된 기간동안 시작값과 종료 값 사이에 속성에 애니메이션을 적용하고 그 사이 렌더링을 처리하도록 함.
- beginTime: 애니메이션의 시작 시간(절대 시간으로 판별해야 함 중요!!)
- fillMode: 시퀀스의 시작과 끝 부분에서 애니메이션 동작을 제어할 수 있음.
- kCAFillModeRemovted: 기본값. 애니메이션이 종료되면 변경된 내용이 제거됨
- kCAFillModeBackwards : 애니메이션의 실제 시작 시간과 상관없이 애니메이션의 첫번째 프레임을 화면에 즉시 표시하고 나중에 애니메이션을 시작함
- kCAFillModeForwards : 평상시처럼 애니메이션을 재생하지만 애니메이션 후 변경된 값을 유지함
- kCAFillModeBoth : 양쪽 유지

- presentation layer(현재 화면에 보여지는 레이어)는 애니메이션 되는 동안에 보여지며 완료 된 후 원래 레이어가 보여질때 해당 presentation layer는 제거됨.
- 애니메이션 이후 값이 유지되게 하려면 isRemovedOnCompletion 속성을 false로 둬야함. 그래야지 model Layer값도 변경이 되어 완료됨
- 화면에서 레이어 애니메이션을 제거하면 해당 레이어는 원래 값으로 돌아감.
- 가능하면 fillMode를 수정하는 것은 자제하는것이 좋다. ~~~

## Animation keys and Delegates
- CABasicAnimation은 애니메이션의 시작과 끝을 알 수 있는 Delegate 패턴을 제공함.
- 이는 kvc를 통하여 구분할 수 있음.
- 이를 통해서 애니메이션이 끝났을 경우 레이어에서 애니메이션을 제거가 가능함.

## Groups and Advanced Timing
- 여러 애니메이션을 하나의 레이어에서 동기적으로 사용하고자 할때 Group Animation을 사용할 수 있음
- Core Animation은 timingfuction을 이용하여 애니메이션의 속도조절?? 느슨함 등을 조절할수 있음
- timing fuction의 경우 지정된 값들도 존재하지만 사용자가 커스텀하여 조작이 가능함
- repeatCount속성은 애니메이션의 반복휫수, repeatDuration은 반복시간
- speed속성은 재생시간과 관계없이 애니메이션의 속도를 제어할 수 있음. 그러므로 duration이 5초라도 speed가 2일경우 2.5만에 실행이 됨
- layer에도 speed속성을 줄 수 있음. 해당 레이어 speed가 2일경우 layer에 add된 애니메이션에 영향을 줌
- layer speed * animation speed

## layer springs
- CASpringAnimation (초기속도와 질량으로 타겟을 오버 슛 함)
- Initial velocity: 초기 속도
- Mass : 무게 질량 - 높을수록 속도가 줄어드는게 느려짐
- Stiffness : 강성(탄력을 더 강하게 해줌)
- Damping : 애니메이션 감속을 빠르게 하기 위해서 증가시키면 됨

## Layer Keyframe Animations and Struct Properties
- keyframe animation을 활용하면 타이밍별로 각 속성을 변경하여 애니메이션을 좀 더 디테일하게 다룰 수 있음
- Core Animation은 C기반 Objective-c 프레임워크로 구조체가 매우 다르게 처리됨. CGPoint와 같은 구조체 속성을 애니메이션화 하는것은 쉽지 않음. 그렇기 때문에 Cocoa framework에는 struct값을 객체로 래핑하는 NSValue 클래스가 존재함 (fromValue, toValue에 CGPoint와 같은 구조체로 값을 할당하면 제대로 동작하지 않음)

## Shapes and Masks
- CAShapeLayer는 여러 모양을 그릴수 있는 레이어. path기반으로 드로잉을 함.
- linDashPhase : 모양 주위에 윤곽의 효과를 줌 ??

## Gradient Animations
- GradientLayer 속성
- startPoint, endPoint : 시작과 끝, 0.0~1.0
- colors : 변할 색상들
- locations : 변경될 지점

<img src="https://github.com/ParkGwangBeom/AnimationStudy/blob/master/Core%20Animation/Resource/gra1.png"/>

<img src="https://github.com/ParkGwangBeom/AnimationStudy/blob/master/Core%20Animation/Resource/gra2.png"/>


## Stroke and path Animations
- strokeEnd : 선이 먼저 시작되 가는부분
- strokeStart : 선이 끝나서 따라가는 부분
- CAKeyframeAnimation의 calculationMode는 애니메이션의 타이밍일 제어할수 있는 또다른 방법임. kCAAnimationPaced로 설정하면 코어애니메이션은 설정한 키 시간을 무시하고 일정한 속도로 에이어에 애니메이션을 적용함.
- kCAAnimationDiscrete은 부드러운 애니메이션을 주는것이 아닌 키값에서 키값으로 점프함.

## Replicating Animations
- CAReplicatorLayer : 애니메이션을 복제할수 있는 컨테이너 레이어
- instanceCount: 복사 갯수
- instanceTransform : 복사본에 적용할 변환
- instanceDelay : 복사본간 애니메이션 지연
- 복제된 레이어의 기본 레이어에 animation을 설정해주면 추가되는데로 애니메이션이 동작하는 형태가 됨
