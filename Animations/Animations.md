# Further Types of Animations

## Particle Emitters
### CAEmitterLayer
- emitterShape는 입자의 모양을 설정할수 있음
- kCAEmitterLayerPoint: 모든 입자가 같은 지점에서 생성되도록 함.

<img src="https://github.com/ParkGwangBeom/AnimationStudy/blob/master/Animations/Resource/ani1.png"/>

- kCAEmitterLayerLine: 프레임 맨 위에서 만듬.

<img src="https://github.com/ParkGwangBeom/AnimationStudy/blob/master/Animations/Resource/ani2.png"/>

- kCAEmitterLayerRectangle: 직사각형 영역을 통해 임의로 입자를 만듬

<img src="https://github.com/ParkGwangBeom/AnimationStudy/blob/master/Animations/Resource/ani3.png"/>

- CAEmitterLayer안에 각 티끌?? 들은 CAEmitterCell을 넣어주어 만들수 있음.

<img src="https://github.com/ParkGwangBeom/AnimationStudy/blob/master/Animations/Resource/ani4.png"/>

- CAEmitterCell 속성
    - birthRate: 매초 생성될 갯수?
    - lifetime: 생성되어있을 시간
    - acceleration: 가속도
    - velocity
    - emissionLongitude: 입자의 시작각도
    - velocityRange : 가속도의 구간을 설정할수 있음. 이걸 설정하면 각. cell이 사이값으로 설정되어 적용됨
    <img src="https://github.com/ParkGwangBeom/AnimationStudy/blob/master/Animations/Resource/ani5.png"/>
    - emissionRange: 방사 각도 구간. velocityRange와 비슷하게 구간사이에 임의의 값으로 설정될수 있도록 구간을 정해줄수 있음.
    <img src="https://github.com/ParkGwangBeom/AnimationStudy/blob/master/Animations/Resource/ani6.png"/>
    - redRange, greenRange, blueRange 셀에서 각 색의 구간을 설정할수 있음.
    - scale: 스케일
    - scaleRange : 스케일 구간
    <img src="https://github.com/ParkGwangBeom/AnimationStudy/blob/master/Animations/Resource/ani7.png"/>

    - scaleSpeed: 시간이 지남에 따라 변화하는 값을 설정할 수 있음.
    - alphaRange: alpha값에 대한 구간
    - alphaSpeed: 시간에 지남에 따른 변화량
    - lifetimeRange: 생존 시간 구간 설정
