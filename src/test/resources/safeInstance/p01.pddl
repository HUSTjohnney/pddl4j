(define (problem Socialsafe_problem)
    (:domain Socialsafe_domain)
    (:objects
        ; street_l3 street_l8 street_l10 street_l12 - location
        ; school_l1 school_l11 church_12 church_l6 church_l14 square_l4 square_l13 market_l5 bar_l9 - attacklocation
        l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 l12 l13 l14 - location
        v1 - vehicle
        ; nitride peroxide - bombtype
        bomb - bombtype
        ; shotgun rifle pistol - guntype
        gun - guntype
        bio - biochemical
        c1 - criminal
    )

    (:init
        ;; 地点可达信息
        (Connect l1 l2)(Connect l1 l3)
        (Connect l2 l1)(Connect l2 l5)
        (Connect l3 l1)(Connect l3 l4)(Connect l3 l6)(Connect l3 l7)
        (Connect l4 l3)(Connect l4 l5)(Connect l4 l7)(Connect l4 l8)
        (Connect l5 l4)(Connect l5 l8)(Connect l5 l2)(Connect l5 l9)
        (Connect l6 l3)(Connect l6 l7)
        (Connect l7 l4)(Connect l7 l6)(Connect l7 l10)
        (Connect l8 l4)(Connect l8 l9)(Connect l8 l11)
        (Connect l9 l8)(Connect l9 l12)
        (Connect l10 l7)(Connect l10 l11)(Connect l10 l13)
        (Connect l11 l10)(Connect l11 l8)
        (Connect l12 l9)(Connect l12 l14)
        (Connect l13 l10)(Connect l13 l14)
        (Connect l14 l12)(Connect l14 l13)

        (criminalAt l1 c1) ;; 初始罪犯位点
        ;;(criminalAt l2 c2) ;; 初始罪犯2
        (HasOnlineLearningResource bomb)
        (CityHasVehicleRental l8)
        (CityHasGunClub l5) ;; 俱乐部位置
        (CityHasGunStore l9) ;; 黑市位置
        (PhysicalFitness c1)
        (IntentionSuicideAttack c1) ;; 有进行自杀攻击的意图
    )

    (:goal
        (and
            ; (achieve_attack l4 bomb) ;; 爆炸式袭击
            ; (achieve_attack l7 gun) ;; 枪械袭击
            ; (achieve_attack l10 bio) ;; 生化炸弹投放
            (achieve_attack l7 v1);; 车辆冲撞。
        )
    )
)