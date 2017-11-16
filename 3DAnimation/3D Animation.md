# Section VI: 3D Animations

## Simple 3D Animations
- CATransform3DIdentity의 m34는 원근감을 조정할 수 있음.
- 레이어에서 3D 변형을 사용하기 위해서는 -1.0 / [distance]로 설정해야함.
    - distance
        -   0.1...500: 아주 가깝고 많은 왜곡을 줌
        - 750...2,000  멋진 관점임. 내용이 선명하게 보임
        - 2,000 and up 거의 원금감과 왜곡이 없음
- CATransform3DRotate(value, x, y, z)임
- 모든 변환은 레이어의 앵커포인트 중심으로 계산이 일어남. 이점 주의해야함
- 코어애니메이션은 모든 내용을 계속해서 다시그리며 이동하는 모든 요소에 대해 왜곡을 다시 계산함. 이것은 효율적이지 않음. 이를 해결하기 위해서는 한번 렌더링된 내용을 캐싱시키면 됨. `shouldRasterize`는 레이어 내용을 이미지로 캐시하도록 코어애니메이션에 지시함. 그런 다음에 `rasterizationScale`을 현재 화면 크기와 일치하도록 설정하면됨.
- shouldRasterize 를 하면 캐시화를 하기 때문에 불필요한것은 안하기 위해서는 적절한 시점에 false를 해줘야함.

## Intermediate 3D animations
- sublayerTransform은 하위 각 개별 계층의 자체 변환과 결합됨.
거의 예제 느낌임..


