(define (problem pfile1)
	(:domain spaceStationArm_domain)
	(:objects

		;; 机械臂可移动基座定义
		j1 - jxbLocation
		j2 - jxbLocation
		j3 - jxbLocation
		j4 - jxbLocation
		j5 - jxbLocation
		j6 - jxbLocation
		j7 - jxbLocation

		;; 载荷可锁定基座定义
		z1 - zhLocation
		z2 - zhLocation
		z3 - zhLocation
		z4 - zhLocation
		z5 - zhLocation

		;; 机械臂定义
		arm1 - Arm

		;; 载荷定义
		load1 - load
		load2 - load
		load3 - load
		load4 - load

		;; 舱定义
		h1 - cabin
		h2 - cabin
		h3 - cabin
		h4 - cabin
	)
	(:init
		;; 机械臂相关状态定义
		(armAt arm1 j1)
		(storeMode arm1)
		(empty arm1)
		(pointing arm1 j2)

		;; 载荷初始位置定义
		(loadInCabin load1 h1)
		(loadInCabin load2 h2)
		(loadInCabin load3 h3)
		(loadInCabin load4 h4)
		(emptyzhlocation z1)
		(emptyzhlocation z2)
		(emptyzhlocation z3)
		(emptyzhlocation z4)
		(emptyzhlocation z5)

		; 机械臂可达节点
		(armReachable j1 j7)
		(armReachable j1 z1)
		(armReachable j1 j2)
		(armReachable j2 j1)
		(armReachable j2 z1)
		(armReachable j2 j6)
		(armReachable j2 j4)
		(armReachable j2 z2)
		(armReachable j2 z3)
		(armReachable j3 j6)
		(armReachable j3 j4)
		(armReachable j3 z2)
		(armReachable j3 z3)
		(armReachable j4 j2)
		(armReachable j4 j5)
		(armReachable j4 j3)
		(armReachable j4 z3)
		(armReachable j4 z4)
		(armReachable j5 j4)
		(armReachable j5 z4)
		(armReachable j6 j2)
		(armReachable j6 j7)
		(armReachable j6 j3)
		(armReachable j6 z2)
		(armReachable j6 z5)
		(armReachable j7 j1)
		(armReachable j7 j6)
		(armReachable j7 z5)
		;; 指向舱
		(armReachable j1 h1)
		(armReachable j5 h2)
		(armReachable j3 h3)
		(armReachable j7 h4)

		;; 初始舱状态
		(doorClose h1)
		(doorClose h2)
		(doorClose h3)
		(doorClose h4)

	)
	(:goal(and
			;(armAt arm1 j3)
			;(pointing arm1 h3)

			;; 舱门最终关闭
			(doorClose h1)
			(doorClose h2)
			(doorClose h3)
			(doorClose h4)

			;; 机械臂变回存储模式
			(storeMode arm1)

			;(loadOnArm arm1 load3)
			;(pointing arm1 z2)
			;(loadOnArm arm1 load2)
			; (not (loadAt load2 z2))

			;(loadAt load3 z3) ;; 可以运行
			;(loadAt load4 z2) ;; 可以运行
			;(loadAt load1 z2) ;; 可以运行
			; (loadAt load1 z1) ;; 可以运行
			;(loadAt load3 z4) ;; 可以运行 80s
			(loadAt load3 z1) ;; 可以运行 152s
			;(loadAt load4 z1)
		)
	)
)