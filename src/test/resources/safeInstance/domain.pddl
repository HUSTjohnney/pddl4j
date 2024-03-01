(define (domain Socialsafe_domain)
	(:requirements :typing :negative-preconditions)
	(:types
		location - object ;; 地点类型
		attacklocation - location ;; 攻击地点类型
		tool - object ;; 工具类型
		axe - tool ;; 斧头工具
		biochemical - tool ;; 生化工具
		bombtype - tool ;; 炸弹类型
		gantype - tool ;; 枪支类型
		vehicle - object ;; 车辆类型
		)

	(:predicates
		(Connect ?l1 - location ?l2 - location) ;; 表示两个地点之间的可达性

		(vehicleAt ?v - vehicle ?l - location) ;; 表示车辆位于某个地点
		;; (vehicleState ?v - vehicle) ;; 你的原始代码中有这一行注释，可能需要根据场景决定是否需要车辆状态的谓词

		(HasOnlineLearningResource ?bt - bombtype) ;; 表示有关某种炸弹的在线学习资源
		(HasVehicleRental ?v - vehicle) ;; 表示有租用特定车辆的渠道
		(HasGunClub) ;; 表示存在枪支俱乐部
		(HasGunStore) ;; 表示存在枪械商店
		(KnifeControl) ;; 表示管控刀具购买
		(AxeMachineryAvailable ?ax - axe) ;; 表示斧头相关机械设备可用

		(LocationStatus ?l - location) ;; 表示地点的状态，可能需要进一步明确其含义
		(PhysicalFitness) ;; 表示满足体能要求
		(QualifiedForExplosives ?bt - bombtype) ;; 表示有购买特定类型炸药的资格
		(SkillMakeExplosive ?bt - bombtype) ;; 表示有制作特定类型炸药的技能
		(SkillUseGun ?gt - gantype) ;; 表示有使用特定类型枪支的技能

		(Scouted ?l - location) ;; 表示已侦察某地点
		(LocationConfirmed ?l - location) ;; 表示某地点已确认
		(IntentionSuicideAttack) ;; 表示有进行自杀攻击的意图

		(FinancialState) ;; 表示财务状况
		(ExplosiveAvailable ?bt - bombtype) ;; 表示特定类型的炸药可用
		(GunAvailable ?gt - gantype) ;; 表示特定类型的枪支可用
		(VehicleAvailable ?v - vehicle) ;; 表示特定的车辆可用
		(BioMaterialAvailable ?bc - biochemical) ;; 表示生化材料可用
		(BombAvailable ?bt - bombtype) ;; 表示炸弹可用

		(RegisteredForGunClub) ;; 表示已注册枪支俱乐部
		(GunPurchaseRecord) ;; 表示存在枪支购买记录
	)

	;; 访问并侦察
	(:action visit_and_investigate
		:parameters (?l - location)
		:precondition (not (Scouted ?l))
		:effect (and (Scouted ?l))
	)

	;; 确认地点
	(:action confirm_location
		:parameters (?l - location)
		:precondition (Scouted ?l)
		:effect (and
			(LocationConfirmed ?l)
			(not (Scouted ?l))
		)
	)

	;; 在线学习
	(:action online_learning
		:parameters (?bt - bombtype)
		:precondition (HasOnlineLearningResource ?bt)
		:effect (SkillMakeExplosive ?bt)
	)

	;; 应征
	(:action enlist
		:precondition (PhysicalFitness)
		:effect ()
	)

	;; 枪支和炸药培训
	(:action firearms_explosives_training
		:parameters (?bt - bombtype ?gt - gantype)
		:precondition ()
		:effect (and
			(SkillMakeExplosive ?bt)
			(SkillUseGun ?gt)
		)
	)

	;; 获得资金
	(:action acquire_funds
		:precondition (not (FinancialState))
		:effect (FinancialState)
	)

	;; 注册农业公司
	(:action register_agriculture_company
		:precondition (FinancialState)
		:effect (QualifiedForExplosives bombtype) ;; 假设注册农业公司使得所有类型的炸药购买资格都得到了
	)

	;; 注册生化公司
	(:action register_biochemical_company
		:precondition (FinancialState)
		:effect (and
			(QualifiedForExplosives bombtype) ;; 假设注册生化公司同样使得所有类型的炸药购买资格都得到了
			(BioMaterialAvailable biochemical) ;; 假设可用的生化材料是通用的，没有具体细分
		)
	)

	;; 获取炸药
	(:action acquire_explosives
		:parameters (?bt - bombtype)
		:precondition (and
			(FinancialState)
			(QualifiedForExplosives ?bt)
		)
		:effect (and
			(ExplosiveAvailable ?bt)
			(not (FinancialState))
		)
	)

	;; 制造炸弹
	(:action make_bomb
		:parameters (?bt - bombtype)
		:precondition (and
			(SkillMakeExplosive ?bt)
			(ExplosiveAvailable ?bt)
		)
		:effect (BombAvailable ?bt)
	)

	;; 购买枪支
	(:action buy_gun
		:parameters (?gt - gantype)
		:precondition (and
			(FinancialState)
			(SkillUseGun ?gt)
			(or (HasGunClub) (HasGunStore)) ;; 假设枪支可以在俱乐部或商店购买
		)
		:effect (and
			(GunAvailable ?gt)
			(not (FinancialState)) ;; 购买后财务状况改变
			(GunPurchaseRecord) ;; 产生购买记录
		)
	)

	;; 租用车辆
	(:action rent_vehicle
		:parameters (?v - vehicle)
		:precondition (and
			(FinancialState)
			(HasVehicleRental ?v)
		)
		:effect (and
			(VehicleAvailable ?v)
			(not (FinancialState)) ;; 租用后财务状况改变
		)
	)

	;; 注册枪支俱乐部
	(:action register_for_gun_club
		:precondition (and
			(FinancialState)
			(HasGunClub)
		)
		:effect (and
			(RegisteredForGunClub)
			(not (FinancialState)) ;; 注册后财务状况改变
		)
	)

	;; 使用车辆
	(:action use_vehicle
		:parameters (?v - vehicle ?l1 - location ?l2 - location)
		:precondition (and
			(VehicleAvailable ?v)
			(vehicleAt ?v ?l1)
			(Connect ?l1 ?l2)
		)
		:effect (and
			(vehicleAt ?v ?l2)
			(not (vehicleAt ?v ?l1))
		)
	)

	;; 自杀攻击准备
	(:action prepare_suicide_attack
		:precondition (and
			(IntentionSuicideAttack)
			(or
				(BombAvailable bombtype)
				(GunAvailable gantype)
			)
		)
		:effect (and
			;; 这里可以根据你的模型需求添加具体效果，比如改变地点状态、消耗武器等
		)
	)
)