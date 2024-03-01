(define (problem Socialsafe_problem)
    (:domain Socialsafe_domain)
    (:objects
        location1 location2 - location
        attacklocation1 - attacklocation
        vehicle1 - vehicle
        bombtype1 - bombtype
        gantype1 - gantype
        axe1 - axe
        biochemical1 - biochemical
    )

    (:init
        (Connect location1 location2)
        (Connect location2 attacklocation1)
        (HasOnlineLearningResource bombtype1)
        (HasVehicleRental vehicle1)
        (HasGunClub)
        (HasGunStore)
        (AxeMachineryAvailable axe1)
        (PhysicalFitness)
        (vehicleAt vehicle1 location1)

        ;; 假设初始状态中，某些资源或条件尚未满足
        (not (Scouted attacklocation1))
        (not (FinancialState))
        (not (SkillMakeExplosive bombtype1))
        (not (ExplosiveAvailable bombtype1))
        (not (BombAvailable bombtype1))
        (not (GunAvailable gantype1))
        (not (VehicleAvailable vehicle1))
        (not (BioMaterialAvailable biochemical1))
    )

    (:goal
        (and
            (LocationConfirmed attacklocation1) ;; 确认攻击地点
            (BombAvailable bombtype1) ;; 炸弹准备好
            (SkillMakeExplosive bombtype1) ;; 学会制造炸弹
            (VehicleAvailable vehicle1) ;; 车辆准备好
            (IntentionSuicideAttack) ;; 有进行自杀攻击的意图
        )
    )
)