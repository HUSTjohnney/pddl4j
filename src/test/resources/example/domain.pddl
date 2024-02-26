;; 1.0 版本：描述了机械臂的爬行&捕获的动作流程，实例化动作700+，最终动作21个。用时1s以内。
;; 2.0 版本：预期考虑舱门（泄压、复压、打开、关闭）和机械臂的保温加热运动模式转换等特征。
;; 这里如果把舱门的事情引入的话，有几个问题：1. 载荷出舱的时候，是机械臂直接伸入舱内把载荷移动出来的吗？2.是不是不需要

(define (domain spaceStationarm_domain)
    (:requirements :typing :negative-preconditions)
    (:types
        Arm - object ;; 机械臂定义
        Load - object ;; lockable机械臂可抓取的东西
        Wing - Load ;; 太阳翼定义
        Node - object
        ArmNode - Node ;; 机械臂位置节点
        LoadNode - Node ;; 载荷位置节点
        ; OpticLoad - Load
        )
    (:predicates
        (ArmAt ?a - arm ?l - ArmNode) ;; 描述机械臂固定端位置
        (LoadAt ?l - load ?z - LoadNode) ;; 描述载荷锁紧在的载荷基座上。
        (Pointing ?a - arm ?l - location)
        (LockedArmNode ?a - arm ?l - ArmNode);; 机械臂自由端锁紧了移动节点
        (BothTerminalLocked ?a - arm) ;; 机械臂两端都锁紧在固定基座上，此时不可进行甩动机械臂
        (LoadOnArm ?a - arm ?l - load) ;; 描述载荷在机械臂上
        (ArmReachable ?at - ArmNode ?to - location) ;; 描述机械臂的可达性
        (EmptyTerminal ?a - arm);; 机械臂自由端是否未抓取物件

        (moveMode ?a - arm) ;; 机械臂处于运动状态
        (storeMode ?a - arm) ;; 机械臂处于存储状态
        (warmMode ?a - arm) ;; 机械臂处于保温状态
        (RestartMode ?a - arm) ;; 机械臂处于重启状态

    )

    ;*************机械臂运动等动作***************；
    ;; 机械臂?a的自由端从?from指向到?to，机械臂固定端位置为?l1
    (:action pointingto
        :parameters (?l1 - ArmNode ?from - Node ?to - Node ?a - arm)
        :precondition (and
            (not (bothTerminalLocked ?a)) ;; 自由端锁紧基座以后不许指向。
            (armAt ?a ?l1)
            (moveMode ?a)
            (pointing ?a ?from)
            (armReachable ?l1 ?to)
            (EmptyTerminal ?a) ;; 不携带载荷
        )
        :effect (and
            (not (pointing ?a ?from))
            (pointing ?a ?to)
        )
    )

    ;; 指向时携带载荷，前提是指向一个空地点
    (:action pointingwithload
        :parameters (?l1 - ArmNode ?from - Node ?to - LoadNode ?a - arm ?l - load)
        :precondition (and
            (not (bothTerminalLocked ?a)) ;; 自由端锁紧基座以后不许指向。
            (armAt ?a ?l1)
            (moveMode ?a)
            (pointing ?a ?from)
            (armReachable ?l1 ?to)
            (loadOnArm ?a ?l) ;; 携带载荷
            (moveable ?l) ;; 载荷是可活动的
            (emptyLoadNode ?to)
        )
        :effect (and
            (not (pointing ?a ?from))
            (pointing ?a ?to)
        )
    )

    ;; 机械臂锁紧移动节点
    (:action lockArmNode
        :parameters (?a - arm ?l - ArmNode)
        :precondition (and
            (pointing ?a ?l) ;; 指向l
            (not (bothTerminallocked ?a));; 指向l存在自由端
            (EmptyTerminal ?a) ;; 未抓捕载荷
            (moveMode ?a)
        )
        :effect (and
            (bothTerminallocked ?a) ;; 机械臂两端皆锁紧
            (lockedArmNode ?a ?l)
        )
    )

    ;; 只有在两端锁紧的情况下才可以解锁
    ;; 只能解锁自由端
    (:action unlockArmNode
        :parameters (?a - arm ?l - ArmNode)
        :precondition (and
            (bothTerminallocked ?a)
            (lockedArmNode ?a ?l)
            (pointing ?a ?l)
            (moveMode ?a)
        )
        :effect (and
            (not (bothTerminallocked ?a))
            (not (lockedArmNode ?a ?l))
        )
    )

    ;; 切换自由端和固定端：
    ;; current:固定端为j1，自由端为j2
    (:action changeState
        :parameters (?a - arm ?j1 - ArmNode ?j2 - ArmNode)
        :precondition (and
            (armAt ?a ?j1)
            (pointing ?a ?j2)
            (bothTerminallocked ?a)
            (lockedArmNode ?a ?j2)
            (moveMode ?a)
        )
        :effect (and
            (armAt ?a ?j2)
            (not (armAt ?a ?j1))
            (pointing ?a ?j1)
            (not (pointing ?a ?j2))
            (lockedArmNode ?a ?j1)
            (not (lockedArmNode ?a ?j2))
        )
    )

    ;; 机械臂锁紧载荷(舱外)
    (:action armLockLoad
        :parameters (?a - arm ?l - load ?z - LoadNode ?at - ArmNode)
        :precondition (and
            (pointing ?a ?z)
            (armAt ?a ?at)
            (moveMode ?a)
            (loadAt ?l ?z)
            (not (bothTerminallocked ?a)) ;; 不能锁紧移动基座
        )
        :effect (and
            (loadOnArm ?a ?l)
            (not (EmptyTerminal ?a)) ;; 机械臂不空闲
        )
    )

    ;; 机械臂解锁载荷(舱外)
    (:action armUnlockload
        :parameters (?a - arm ?l - load ?z - LoadNode)
        :precondition (and
            (loadOnArm ?a ?l)
            (pointing ?a ?z)
            (moveMode ?a)
            (not (moveable ?l)) ;; 载荷应该锁紧在基座上才能松开。
        )
        :effect (and
            (not (loadOnArm ?a ?l))
            ;(loadAt ?l ?z)
            (EmptyTerminal ?a)
        )
    )

    ;; 机械臂从舱中抓取载荷。
    (:action catchLoadFromCabin
        :parameters (?a - arm ?l - load ?c - cabin)
        :precondition (and
            (doorOpen ?c)
            (pointing ?a ?c) ;; 机械臂指向这个舱
            (moveMode ?a) ;; 机械臂处于运动模式
            (loadInCabin ?l ?c)
            (EmptyTerminal ?a) ;; 机械臂自由端为空
        )
        :effect (and
            (loadOnArm ?a ?l)
            (not (EmptyTerminal ?a))
        )
    )

    ;***************载荷相关动作**************； 

    ; 基座解锁载荷(舱外)
    (:action locationUnlockLoad
        :parameters (?l - load ?z - LoadNode ?a - arm)
        :precondition (and
            (loadAt ?l ?z) ;; 载荷也固定在基座上
            (loadOnArm ?a ?l) ;; 载荷在机械臂上
        )
        :effect (and
            (not (loadAt ?l ?z))
            (moveable ?l)
            (emptyLoadNode ?z)
        )
    )

    ; 基座锁紧载荷(舱外)
    (:action locationLockLoad
        :parameters (?l - load ?z - LoadNode ?a - arm)
        :precondition (and
            (pointing ?a ?z) ;; 机械臂指向这个基座
            (loadOnArm ?a ?l) ;; 载荷在机械臂上
            (emptyLoadNode ?z) ;; 该载荷基座空闲
        )
        :effect (and
            (loadAt ?l ?z)
            (not (moveable ?l))
            (not (emptyLoadNode ?z))
        )
    )

    ;*************机械臂模式切换等动作************； 
    (:action RestartArm
        :parameters (?a - arm)
        :precondition (and
            (storeMode ?a)
        )
        :effect (and
            (not (storeMode ?a))
            (RestartMode ?a)
        )
    )

    (:action warmArm
        :parameters (?a - arm)
        :precondition (and
            (RestartMode ?a)
        )
        :effect (and
            (not (RestartMode ?a))
            (warmMode ?a)
        )
    )

    (:action moveArm
        :parameters (?a - arm)
        :precondition (and
            (warmMode ?a)
        )
        :effect (and
            (not (warmMode ?a))
            (moveMode ?a)
        )
    )

    ;; 运动模式转回安全存储模式
    (:action storeArm
        :parameters (?a - arm)
        :precondition (and
            (moveMode ?a)
            (EmptyTerminal ?a) ;; 自由端未抓取载荷时
        )
        :effect (and
            (not (moveMode ?a))
            (storeMode ?a)
        )
    )

    ;*************舱相关动作************； 
    (:action presureRelief
        :parameters (?c - cabin)
        :precondition (and
            (doorClose ?c)
        )
        :effect (and
            (cabinPressureRelief ?c)
        )
    )

    (:action openDoor
        :parameters (?c - cabin)
        :precondition (and ;; 泄压且门关闭的情况下才可以开门
            (doorClose ?c)
            (cabinPressureRelief ?c)
        )
        :effect (and
            (not (doorClose ?c))
            (doorOpen ?c)
        )
    )

    (:action RePressure
        :parameters (?c - cabin)
        :precondition (and
            (doorClose ?c)
            (cabinPressureRelief ?c)
        )
        :effect (and
            (not (cabinPressureRelief ?c))
            (cabinRePressure ?c)
        )
    )

    (:action closeDoor
        :parameters (?c - cabin)
        :precondition (and
            (doorOpen ?c)
        )
        :effect (and
            (doorClose ?c)
        )
    )

    ;; 舱释放载荷
    (:action releaseLoad
        :parameters (?c - cabin ?l - load ?a - arm)
        :precondition (and
            (loadInCabin ?l ?c)
            (loadOnArm ?a ?l)
        )
        :effect (and
            (moveable ?l)
            (not (loadInCabin ?l ?c))
        )
    )

)