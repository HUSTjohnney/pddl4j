(define (problem Socialsafe_problem)
    (:domain Socialsafe_domain)
    (:objects
        ; street_l3 street_l8 street_l10 street_l12 - location
        ; school_l1 school_l11 church_12 church_l6 church_l14 square_l4 square_l13 market_l5 bar_l9 - attacklocation
        l1 l2 l3 l4 l5 l6 l7 l8 l9 - location
        v1 - vehicle
        bomb1 - bombtype
        peroxide rifle pistol - gantype
        axe1 - axe
        bio1 - biochemical
    )

    (:init
        ;; 地点可达信息
        (Connect l1 l2)(Connect l1 l3)
        (Connect l2 l1)(Connect l2 l5)
        (Connect l3 l1)(Connect l3 l4)(Connect l3 l6)(Connect l3 l7)
        (Connect l4 l3)(Connect l4 l5)(Connect l4 l7)(Connect l4 l8)
        (Connect l5 l4)(Connect l5 l8)(Connect l5 l2)(Connect l5 l9)

        (criminalAt l1) ;; 初始罪犯位点

        ; (Connect location2 l3)
        (HasOnlineLearningResource bomb1)
        ;(HasVehicleRental)
        (HasGunClub)
        ;;(HasGunStore)
        (available axe1)
        (PhysicalFitness)
        (IntentionSuicideAttack) ;; 有进行自杀攻击的意图

        ;; 假设初始状态中，某些资源或条件尚未满足
        ; (not (Scouted l3))
        ; (not (c))
        ; (not (SkillMakeExplosive bomb1))
        ; (not (available bomb1))
        ; ; (not (available bomb1))
        ; (not (available gantype1))
        ; (not (VehicleAvailable v1))
        ; (not (BioMaterialAvailable biochemical1))
    )

    (:goal
        (and
            ; (LocationConfirmed l3) ;; 确认攻击地点
            (available bomb1) ;; 炸弹准备好
             (available v1) ;; 车辆准备好
            ;(available rifle)
             (achieve_suicide_attack l8 pistol)


        )
    )
)