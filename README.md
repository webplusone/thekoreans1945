# thekoreans1945

## 주의사항
1. 배포시 파라미터는 순서대로

    (1) nft주소,

    (2) 화리에 사용되는 nft들 주소 배열(가이아 3종 + 소울링크 + 실타래 등 포함. 개수는 최소 5개 이상),
    
    (3) 프리민팅에 사용되는 nft들 주소 배열(가이아 3종 + 소울링크. 생성자내에서 입력된 주소가 4개인지 체크함)

2. 생성자의 2번, 3번 파라미터들은 이후 onlyOwner 함수로 수정 가능.
3. 유저 화리는 setUserWhitelist 로 수정 가능.
4. airdrop 은 시간과 상관없이 언제든 가능.
5. mint 는 화리 대상자는 파라미터로 AddressZero 를 입력. 이외에는 nft 주소를 입력. public Minting 타임에는 뭘 넣어도 상관x
6. mint 는 시간에 따라 4단계로 나뉨. 모든 시간은 constant 로 박혀있음.

    5.1) 1660564800(한국 15일 오후 9시) 이전 : 민팅 불가

    5.2) 1660568400(한국 15일 오후 10시) 이전 : [1차 민팅]
    
    화리유저들은 단 1개 민팅 가능. nft 홀더들은 가이아3종 + 소울링크 보유자에 한해서만 nft 당 단 1개 민팅 가능. 이때 발급받은 개수도 다음 민팅시 영향을 줌.

    5.3) 1660654800(한국 16일 오후 10시) 이전 : [2차 민팅]
    
     화리유저들 중 이전 단계에서 참여 안한 유저들만 1개 민팅 가능. 대상 nft 홀더들은 누구든 nft 보유 개수 한도로 민팅 가능. 다만 가이아3종/소울링크 보유자들은 이전 단계에서 민팅 했을 경우 1개가 이미 올라가있는 상태.

    5.4) 1660654800(한국 16일 오후 10시) 이후 : [3차 민팅]
    
    누구나 제한없이 민팅 가능.

7. case

        A : 화리대상자_1차 참여

        B : 화리대상자_1차 미참여

        C : 제네시스, 슈퍼노바 2개씩 보유자_1차 참여

        D : 제네시스, 슈퍼노바 2개씩 보유자_1차 미참여

        E : 제네시스, 슈퍼노바 1개씩 보유자_1차 참여

        F : 제네시스, 슈퍼노바 1개씩 보유자_1차 제네시스만 참여

        G : 실타래 2개 보유자


        A는 1차 민팅에 참여했기에 2차에는 참여불가

        B는 1차 민팅에 미참여했기에 2차 참여 가능
        
        C는 1차 민팅에서 최대 2개까지 민팅 가능(제네시스 1개, 슈퍼노바 1개). 2차에서는 아직 제네시스1개 슈퍼노바1개의 여유가 남았기에 2개 더 민팅 가능
        
        D는 1차 민팅에 미참여. 2차 민팅에서 최대 4개까지 참여 가능.
        
        E는 1차 민팅에서 2개를 모두 민팅했기에 2차에서는 민팅 불가.
        
        F는 1차 민팅에서 제네시스만 사용했기에, 2차에서 슈퍼노바에서 기인한 1개 추가로 민팅 가능.
        
        G는 1차 민팅 참여 불가고, 2차 민팅에서 2개까지 민팅 가능.