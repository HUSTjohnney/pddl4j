(define (domain Socialsafe_domain)
	(:requirements :typing :negative-preconditions)
	; :hierarchy :method-preconditions 
	(:types
		location - object ;; 地点类型
		tool - object ;; 工具类型
		biochemical - tool ;; 生化工具
		bombtype - tool ;; 炸弹类型
		guntype - tool ;; 枪支类型
		vehicle - tool ;; 车辆类型
		criminal - object ;; 罪犯
		)

	(:predicates

		(criminalAt ?l1 - location ?c - criminal) ;; 罪犯初始所在位置
		(vehicleAt ?l - location) ;; 车辆位置，拥有车辆后，位置在人物位置

		(Obtaintool ?t - tool) ;; 罪犯获取到的工具是可用的，如斧头、生化工具、炸弹、枪支、车辆等。

		;; 初始环境谓词
		(HasOnlineLearningResource ?bt - bombtype) ;; 表示有关某种炸弹的在线学习资源
		(CityHasVehicleRental ?l - location) ;; 表示位置l有租车辆渠道
		(CityHasGunClub ?l - location) ;; 表示存在枪支俱乐部
		(CityHasGunStore ?l - location) ;; 表示存在枪械商店
		;;(KnifeControl) ;; 表示管控刀具购买
		(PhysicalFitness ?c - criminal)
		(Connect ?l1 - location ?l2 - location) ;; 表示两个地点之间的可达性
		(IntentionSuicideAttack ?c - criminal) ;; 罪犯有进行自杀攻击的意图
		(financialavilable ?c - criminal) ;; 表示财务状况充足

		;; 规划过程谓词
		(Scouted ?l - location) ;; 表示已侦察某地点
		(LocationConfirmed ?l - location) ;; 表示某地点已确认
		(QualifiedForbombtype ?bt - bombtype) ;; 表示有购买特定类型爆炸物资格
		(QualifiedForbiobomb ?bio - biochemical)
		(haveExplosiveMaterial) ;; 购买到爆炸物
		(SkillUseOrMake ?t - tool) ;; 表示拥有特定工具的使用或制作技能。
		(GunPurchaseRecord ?c - criminal) ;; 表示存在枪支购买记录
		(achieve_attack ?l - location ?t - tool) ;; 表示行动完成。目的地为l，采用工具t
	)

	;; 前往某地
	(:action moveto
		:parameters (?l1 - location ?l2 - location ?c - criminal)
		:precondition (and
			(criminalAt ?l1 ?c)
			(Connect ?l1 ?l2)
		)
		:effect (and
			(not (criminalAt ?l1 ?c))
			(criminalAt ?l2 ?c)
		)
	)

	;; 开车前往某地
	(:action movetobycar
		:parameters (?v - vehicle ?c - criminal ?l1 - location ?l2 - location)
		:precondition (and
			(criminalAt ?l1 ?c)
			(Connect ?l1 ?l2)
			(vehicleAt ?l1)
		)
		:effect (and
			(not (criminalAt ?l1 ?c))
			(not (vehicleAt ?l1))
			(criminalAt ?l2 ?c)
			(vehicleAt ?l2)
		)
	)

	;; 走访排查
	(:action visit_and_investigate
		:parameters (?l - location ?c - criminal)
		:precondition (and (not (Scouted ?l))
			(criminalAt ?l ?c)
		)
		:effect (and (Scouted ?l))
	)

	;; 确认地点
	(:action confirm_location
		:parameters (?l - location ?c - criminal)
		:precondition (and (Scouted ?l)
			(criminalAt ?l ?c)
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
		:effect (SkillUseOrMake ?bt)
	)

	; 应征入伍：学习枪支炸药使用
	(:action enlist
		:parameters (?gt - guntype ?bt - bombtype ?c - criminal)
		:precondition (PhysicalFitness ?c)
		:effect (and
			(SkillUseOrMake ?bt)
			(SkillUseOrMake ?gt)
		)
	)

	;; 获得资金
	(:action acquire_funds
		:parameters (?c - criminal)
		:precondition (not (financialavilable ?c))
		:effect (financialavilable ?c)
	)

	;; 注册农业公司
	(:action register_AgriCompany
		:parameters (?bio - biochemical ?bt - bombtype ?c - criminal)
		:precondition (financialavilable ?c)
		:effect (and
			(QualifiedForbiobomb ?bio) ;; 假设注册农业公司使得所有类型的炸药购买资格都得到了
			(QualifiedForbombtype ?bt)
			(SkillUseOrMake ?bio)
		)
	)

	;; 注册生化公司
	(:action register_BioCompany
		:parameters (?bio - biochemical ?bt - bombtype ?c - criminal)
		:precondition (financialavilable ?c)
		:effect (and
			(QualifiedForbiobomb ?bio) ;; 获得生化材料购买资格
			(QualifiedForbombtype ?bt) ;; 获得爆炸材料购买资格
			(SkillUseOrMake ?bio)
		)
	)

	;; 购买爆炸物材料
	(:action acquire_explosives
		:parameters (?bt - bombtype ?c - criminal)
		:precondition (and
			(financialavilable ?c) ;; 有经济实力
			(QualifiedForbombtype ?bt) ;; 有购买许可
		)
		:effect (and
			(haveExplosiveMaterial)
			(not (financialavilable ?c))
		)
	)

	;; 制造炸弹
	(:action make_bomb
		:parameters (?bt - bombtype)
		:precondition (and
			(SkillUseOrMake ?bt)
			(haveExplosiveMaterial)
		)
		:effect (Obtaintool ?bt)
	)

	;; 制造生化武器
	(:action make_bioBomb
		:parameters (?bio - biochemical)
		:precondition (and
			(haveExplosiveMaterial)
			(SkillUseOrMake ?bio)
		)
		:effect (and
			(Obtaintool ?bio)
		)
	)

	;; 购买枪支
	(:action buy_gun_from_club
		:parameters (?gt - guntype ?c - criminal ?l - location)
		:precondition (and
			(financialavilable ?c)
			(SkillUseOrMake ?gt)
			(CityHasGunClub ?l) ;; 假设枪支可以在俱乐部或商店购买
			(criminalAt ?l ?c)
		)
		:effect (and
			(Obtaintool ?gt)
			(not (financialavilable ?c)) ;; 购买后财务状况改变
			(GunPurchaseRecord ?c) ;; 产生购买记录
		)
	)

	(:action buy_gun_from_store
		:parameters (?gt - guntype ?c - criminal ?l - location)
		:precondition (and
			(financialavilable ?c)
			(SkillUseOrMake ?gt)
			(CityHasGunStore ?l) ;; 假设枪支可以在俱乐部或商店购买
			(criminalAt ?l ?c)
		)
		:effect (and
			(Obtaintool ?gt) ;; 枪支可用
			(not (financialavilable ?c)) ;; 购买后财务状况改变
			(GunPurchaseRecord ?c) ;; 产生购买记录
		)
	)

	;; 租用车辆
	(:action rent_vehicle
		:parameters (?v - vehicle ?c - criminal ?l - location)
		:precondition (and
			(financialavilable ?c) ;; 经济实力充裕
			(CityHasVehicleRental ?l) ;; 存在租车地方
		)
		:effect (and
			(Obtaintool ?v)
			(not (financialavilable ?c)) ;; 租用后财务状况改变
			(vehicleAt ?l)
		)
	)

	;; 盗窃车辆
	(:action steal_vehicle
		:parameters (?v - vehicle ?c - criminal ?l - location)
		:precondition (and
			(not (financialavilable ?c))
			(criminalAt ?l ?c)
		)
		:effect (and
			(Obtaintool ?v)
			(vehicleAt ?l)
		)
	)

	;; 自杀式爆炸案
	(:action suicide_attack_bybomb
		:parameters (?bt - bombtype ?l - location ?v - vehicle ?c - criminal)
		:precondition (and
			(IntentionSuicideAttack ?c)
			(Obtaintool ?bt)
			(criminalAt ?l ?c)
			(LocationConfirmed ?l)
			(vehicleAt ?l) ;; 车辆在目的地位置
		)
		:effect (and
			(achieve_attack ?l ?bt)
		)
	)

	;; 枪击事件
	(:action attack_bygan
		:parameters (?gt - guntype ?l - location ?c - criminal)
		:precondition (and
			(Obtaintool ?gt)
			(criminalAt ?l ?c)
			(LocationConfirmed ?l)
		)
		:effect (and
			(achieve_attack ?l ?gt)
		)
	)

	;; 遥控爆炸
	(:action explosives_attack
		:parameters (?bt - bombtype ?l - location ?c - criminal)
		:precondition (and
			(not (criminalAt ?l ?c)) ;; 罪犯不在攻击地点
			(vehicleAt ?l) ;; 车在攻击地点
			(Obtaintool ?bt)
			(LocationConfirmed ?l)
		)
		:effect (and
			(achieve_attack ?l ?bt)
		)
	)

	;; 生化炸弹投放
	(:action bio_attack
		:parameters (?bio - biochemical ?l - location ?c - criminal)
		:precondition (and
			(Obtaintool ?bio) ;; 拥有生化武器
			(LocationConfirmed ?l) ;; 位置已确定
			(criminalAt ?l ?c) ;; 罪犯前往攻击点
		)
		:effect (and
			(achieve_attack ?l ?bio)
		)
	)

	;; 冲撞事件
	(:action vehicle_attack
		:parameters (?v - vehicle ?l - location ?c - criminal)
		:precondition (and
			(criminalAt ?l ?c)
			(vehicleAt ?l)
			(Obtaintool ?v)
			(LocationConfirmed ?l)
		)
		:effect (and
			(achieve_attack ?l ?v)
		)
	)

)