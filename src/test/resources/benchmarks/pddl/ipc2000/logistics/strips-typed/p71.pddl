(define (problem logistics-35-0)
(:domain logistics)
(:objects
    apn3
    apn2
    apn1
 - airplane
    apt12
    apt11
    apt10
    apt9
    apt8
    apt7
    apt6
    apt5
    apt4
    apt3
    apt2
    apt1
 - airport
    pos1
    pos2
    pos3
    pos4
    pos5
    pos6
    pos7
    pos8
    pos9
    pos10
    pos11
    pos12
 - location
    cit12
    cit11
    cit10
    cit9
    cit8
    cit7
    cit6
    cit5
    cit4
    cit3
    cit2
    cit1
 - city
    tru12
    tru11
    tru10
    tru9
    tru8
    tru7
    tru6
    tru5
    tru4
    tru3
    tru2
    tru1
 - truck
    obj123
    obj122
    obj121
    obj113
    obj112
    obj111
    obj103
    obj102
    obj101
    obj93
    obj92
    obj91
    obj83
    obj82
    obj81
    obj73
    obj72
    obj71
    obj63
    obj62
    obj61
    obj53
    obj52
    obj51
    obj43
    obj42
    obj41
    obj33
    obj32
    obj31
    obj23
    obj22
    obj21
    obj13
    obj12
    obj11
 - package
)
(:init
    (at apn1 apt12)
    (at apn2 apt12)
    (at apn3 apt7)
    (at tru1 pos1)
    (at obj11 pos1)
    (at obj12 pos1)
    (at obj13 pos1)
    (at tru2 pos2)
    (at obj21 pos2)
    (at obj22 pos2)
    (at obj23 pos2)
    (at tru3 pos3)
    (at obj31 pos3)
    (at obj32 pos3)
    (at obj33 pos3)
    (at tru4 pos4)
    (at obj41 pos4)
    (at obj42 pos4)
    (at obj43 pos4)
    (at tru5 pos5)
    (at obj51 pos5)
    (at obj52 pos5)
    (at obj53 pos5)
    (at tru6 pos6)
    (at obj61 pos6)
    (at obj62 pos6)
    (at obj63 pos6)
    (at tru7 pos7)
    (at obj71 pos7)
    (at obj72 pos7)
    (at obj73 pos7)
    (at tru8 pos8)
    (at obj81 pos8)
    (at obj82 pos8)
    (at obj83 pos8)
    (at tru9 pos9)
    (at obj91 pos9)
    (at obj92 pos9)
    (at obj93 pos9)
    (at tru10 pos10)
    (at obj101 pos10)
    (at obj102 pos10)
    (at obj103 pos10)
    (at tru11 pos11)
    (at obj111 pos11)
    (at obj112 pos11)
    (at obj113 pos11)
    (at tru12 pos12)
    (at obj121 pos12)
    (at obj122 pos12)
    (at obj123 pos12)
    (in-city pos1 cit1)
    (in-city apt1 cit1)
    (in-city pos2 cit2)
    (in-city apt2 cit2)
    (in-city pos3 cit3)
    (in-city apt3 cit3)
    (in-city pos4 cit4)
    (in-city apt4 cit4)
    (in-city pos5 cit5)
    (in-city apt5 cit5)
    (in-city pos6 cit6)
    (in-city apt6 cit6)
    (in-city pos7 cit7)
    (in-city apt7 cit7)
    (in-city pos8 cit8)
    (in-city apt8 cit8)
    (in-city pos9 cit9)
    (in-city apt9 cit9)
    (in-city pos10 cit10)
    (in-city apt10 cit10)
    (in-city pos11 cit11)
    (in-city apt11 cit11)
    (in-city pos12 cit12)
    (in-city apt12 cit12)
)
(:goal (and
    (at obj81 pos1)
    (at obj62 pos5)
    (at obj123 pos7)
    (at obj42 apt12)
    (at obj112 apt6)
    (at obj63 apt8)
    (at obj111 pos5)
    (at obj122 apt5)
    (at obj72 pos1)
    (at obj52 apt2)
    (at obj103 apt3)
    (at obj61 apt5)
    (at obj21 apt9)
    (at obj31 apt12)
    (at obj121 pos12)
    (at obj41 apt10)
    (at obj51 apt5)
    (at obj22 pos3)
    (at obj93 apt10)
    (at obj13 apt5)
    (at obj71 pos7)
    (at obj73 pos7)
    (at obj92 apt2)
    (at obj12 apt6)
    (at obj83 apt8)
    (at obj33 pos12)
    (at obj102 pos11)
    (at obj23 pos12)
    (at obj11 apt9)
    (at obj32 apt3)
    (at obj43 apt7)
    (at obj91 pos5)
    (at obj53 apt6)
    (at obj113 pos9)
    (at obj101 apt12)
)
)
)
