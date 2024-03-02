(define (domain Socialsafe_domain)
	(:requirements :typing :negative-preconditions)
	; :hierarchy :method-preconditions 
	(:types
		location - object ;; 地点类型
		tool - object ;; 工具类型
		axe - tool ;; 斧头工具
		biochemical - tool ;; 生化工具
		bombtype - tool ;; 炸弹类型
		gantype - tool ;; 枪支类型
		vehicle - tool ;; 车辆类型
		)

	(:predicates
		(Connect ?l1 - location ?l2 - location) ;; 表示两个地点之间的可达性

		(criminalAt ?l1 - location) ;; 罪犯初始所在位置

		(available ?t - tool) ;; 工具是可用的，如斧头、生化工具、炸弹、枪支、车辆等。

		(HasOnlineLearningResource ?bt - bombtype) ;; 表示有关某种炸弹的在线学习资源
		(HasVehicleRental) ;; 表示有租用车辆渠道
		(HasGunClub) ;; 表示存在枪支俱乐部
		(HasGunStore) ;; 表示存在枪械商店
		;;(KnifeControl) ;; 表示管控刀具购买
		(PhysicalFitness)

		(Scouted ?l - location) ;; 表示已侦察某地点
		(LocationConfirmed ?l - location) ;; 表示某地点已确认

		(QualifiedForbombtype ?bt - bombtype) ;; 表示有购买特定类型炸药的资格
		(QualifiedForbiochemical ?b - biochemical)

		(SkillMakeExplosive ?bt - bombtype) ;; 表示有制作特定类型炸药的技能
		(SkillUseGun ?gt - gantype) ;; 表示有使用特定类型枪支的技能
		(haveExplosiveMaterial) ;; 购买到爆炸物了

		(IntentionSuicideAttack) ;; 罪犯有进行自杀攻击的意图

		(financialavilable) ;; 表示财务状况充足

		;;(RegisteredForGunClub) ;; 表示已注册枪支俱乐部
		(GunPurchaseRecord) ;; 表示存在枪支购买记录

		(achieve_attack ?l - location ?t - tool) ;; 表示行动完成。目的地为l，采用工具t
	)

	;; 走访排查
	(:action visit_and_investigate
		:parameters (?l - location)
		:precondition (and (not (Scouted ?l))
			(criminalAt ?l)
		)
		:effect (and (Scouted ?l))
	)

	;; 确认地点
	(:action confirm_location
		:parameters (?l - location)
		:precondition (and (Scouted ?l)
			(criminalAt ?l)
		)
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

	; 应征
	(:action enlist
		:parameters (?gt - gantype ?bt - bombtype)
		:precondition (PhysicalFitness)
		:effect (and
			(SkillMakeExplosive ?bt)
			(SkillUseGun ?gt)
		)
	)

	; ;; 入伍后枪支学习
	; (:action firearms_explosives_training
	; 	:parameters (?bt - bombtype ?gt - gantype)
	; 	:precondition ()
	; 	:effect (and
	; 		(SkillMakeExplosive ?bt)
	; 		(SkillUseGun ?gt)
	; 	)
	; )

	;; 获得资金
	(:action acquire_funds
		:parameters ()
		:precondition (not (financialavilable))
		:effect (financialavilable)
	)

	;; 注册农业公司
	(:action register_agriculture_company
		:parameters (?b - biochemical ?bt - bombtype)
		:precondition (financialavilable)
		:effect (and 
			(QualifiedForbiochemical ?b) ;; 假设注册农业公司使得所有类型的炸药购买资格都得到了
			(QualifiedForbombtype ?bt))
	)

	;; 注册生化公司
	(:action register_biochemical_company
		:parameters (?b - biochemical ?bt - bombtype)
		:precondition (financialavilable)
		:effect (and
			(QualifiedForbiochemical ?b) ;; 获得生化材料购买资格
			(QualifiedForbombtype ?bt) ;; 获得爆炸材料购买资格
		)
	)

	;; 购买爆炸物材料
	(:action acquire_explosives
		:parameters (?bt - bombtype)
		:precondition (and
			(financialavilable) ;; 有经济实力
			(QualifiedForbombtype ?bt) ;; 有购买许可
		)
		:effect (and
			(haveExplosiveMaterial)
			(not (financialavilable))
		)
	)

	;; 制造炸弹
	(:action make_bomb
		:parameters (?bt - bombtype)
		:precondition (and
			(SkillMakeExplosive ?bt)
			(haveExplosiveMaterial)
		)
		:effect (available ?bt)
	)

	;; 购买枪支
	(:action buy_gun_from_club
		:parameters (?gt - gantype)
		:precondition (and
			(financialavilable)
			(SkillUseGun ?gt)
			(HasGunClub) ;; 假设枪支可以在俱乐部或商店购买
		)
		:effect (and
			(available ?gt)
			(not (financialavilable)) ;; 购买后财务状况改变
			(GunPurchaseRecord) ;; 产生购买记录
		)
	)

	(:action buy_gun_from_store
		:parameters (?gt - gantype)
		:precondition (and
			(financialavilable)
			(SkillUseGun ?gt)
			(HasGunStore) ;; 假设枪支可以在俱乐部或商店购买
		)
		:effect (and
			(available ?gt) ;; 枪支可用
			(not (financialavilable)) ;; 购买后财务状况改变
			(GunPurchaseRecord) ;; 产生购买记录
		)
	)

	;; 租用车辆
	(:action rent_vehicle
		:parameters (?v - vehicle)
		:precondition (and
			(financialavilable) ;; 经济实力充裕
			(HasVehicleRental) ;; 存在租车地方
		)
		:effect (and
			(available ?v)
			(not (financialavilable)) ;; 租用后财务状况改变
		)
	)

	;; 盗窃车辆
	(:action steal_vehicle
		:parameters (?v - vehicle)
		:precondition (and
			(not (financialavilable))
		)
		:effect (and
			(available ?v)
		)
	)

	;; 注册枪支俱乐部
	(:action register_for_gun_club
		:parameters ()
		:precondition (and
			(financialavilable)

		)
		:effect (and
			(HasGunClub)
			(not (financialavilable)) ;; 注册后财务状况改变
		)
	)

	;; 前往某地
	(:action move
		:parameters (?l1 - location ?l2 - location)
		:precondition (and
			(criminalAt ?l1)
			(Connect ?l1 ?l2)
		)
		:effect (and
			(not (criminalAt ?l1))
			(criminalAt ?l2)
		)
	)

	;; 自杀式爆炸案
	(:action suicide_attack_bybomb
		:parameters (?bt - bombtype ?l - location ?v - vehicle)
		:precondition (and
			(IntentionSuicideAttack)
			(available ?bt)
			(criminalAt ?l)
			(LocationConfirmed ?l)
			(available ?v) ;; 车辆可用
		)
		:effect (and
			(achieve_attack ?l ?bt)
		)
	)

	;; 枪击事件
	(:action attack_bygan
		:parameters (?gt - gantype ?l - location)
		:precondition (and
			(available ?gt)
			(criminalAt ?l)
			(LocationConfirmed ?l)
		)
		:effect (and
			(achieve_attack ?l ?gt)
		)
	)

	;; 遥控爆炸
	(:action explosives_attack
		:parameters (?b - bombtype ?l - location)
		:precondition (and
			(not (criminalAt ?l)) ;; 罪犯不在攻击地点
			(available ?b)
			(LocationConfirmed ?l)
		)
		:effect (and
			(achieve_attack ?l ?b)
		)
	)

)