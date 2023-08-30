(define (problem freecell-11-5)
(:domain freecell)
(:objects
    sj
    hj
    dj
    cj
    s10
    h10
    d10
    c10
    s9
    h9
    d9
    c9
    s8
    h8
    d8
    c8
    s7
    h7
    d7
    c7
    s6
    h6
    d6
    c6
    s5
    h5
    d5
    c5
    s4
    h4
    d4
    c4
    s3
    h3
    d3
    c3
    sa
    s2
    s0
    ha
    h2
    h0
    da
    d2
    d0
    ca
    c2
    c0
 - card
    n8
    n7
    n6
    n5
    n4
    n3
    n13
    n12
    n11
    n9
    n10
    n1
    n2
    n0
 - num
    s
    h
    d
    c
 - suit
)
(:init
    (value c0 n0)
    (value c10 n10)
    (value c2 n2)
    (value c3 n3)
    (value c4 n4)
    (value c5 n5)
    (value c6 n6)
    (value c7 n7)
    (value c8 n8)
    (value c9 n9)
    (value ca n1)
    (value cj n11)
    (value d0 n0)
    (value d10 n10)
    (value d2 n2)
    (value d3 n3)
    (value d4 n4)
    (value d5 n5)
    (value d6 n6)
    (value d7 n7)
    (value d8 n8)
    (value d9 n9)
    (value da n1)
    (value dj n11)
    (value h0 n0)
    (value h10 n10)
    (value h2 n2)
    (value h3 n3)
    (value h4 n4)
    (value h5 n5)
    (value h6 n6)
    (value h7 n7)
    (value h8 n8)
    (value h9 n9)
    (value ha n1)
    (value hj n11)
    (value s0 n0)
    (value s10 n10)
    (value s2 n2)
    (value s3 n3)
    (value s4 n4)
    (value s5 n5)
    (value s6 n6)
    (value s7 n7)
    (value s8 n8)
    (value s9 n9)
    (value sa n1)
    (value sj n11)
    (successor n1 n0)
    (successor n10 n9)
    (successor n11 n10)
    (successor n12 n11)
    (successor n13 n12)
    (successor n2 n1)
    (successor n3 n2)
    (successor n4 n3)
    (successor n5 n4)
    (successor n6 n5)
    (successor n7 n6)
    (successor n8 n7)
    (successor n9 n8)
    (suit c0 c)
    (suit c10 c)
    (suit c2 c)
    (suit c3 c)
    (suit c4 c)
    (suit c5 c)
    (suit c6 c)
    (suit c7 c)
    (suit c8 c)
    (suit c9 c)
    (suit ca c)
    (suit cj c)
    (suit d0 d)
    (suit d10 d)
    (suit d2 d)
    (suit d3 d)
    (suit d4 d)
    (suit d5 d)
    (suit d6 d)
    (suit d7 d)
    (suit d8 d)
    (suit d9 d)
    (suit da d)
    (suit dj d)
    (suit h0 h)
    (suit h10 h)
    (suit h2 h)
    (suit h3 h)
    (suit h4 h)
    (suit h5 h)
    (suit h6 h)
    (suit h7 h)
    (suit h8 h)
    (suit h9 h)
    (suit ha h)
    (suit hj h)
    (suit s0 s)
    (suit s10 s)
    (suit s2 s)
    (suit s3 s)
    (suit s4 s)
    (suit s5 s)
    (suit s6 s)
    (suit s7 s)
    (suit s8 s)
    (suit s9 s)
    (suit sa s)
    (suit sj s)
    (canstack c10 dj)
    (canstack c10 hj)
    (canstack c2 d3)
    (canstack c2 h3)
    (canstack c3 d4)
    (canstack c3 h4)
    (canstack c4 d5)
    (canstack c4 h5)
    (canstack c5 d6)
    (canstack c5 h6)
    (canstack c6 d7)
    (canstack c6 h7)
    (canstack c7 d8)
    (canstack c7 h8)
    (canstack c8 d9)
    (canstack c8 h9)
    (canstack c9 d10)
    (canstack c9 h10)
    (canstack ca d2)
    (canstack ca h2)
    (canstack d10 cj)
    (canstack d10 sj)
    (canstack d2 c3)
    (canstack d2 s3)
    (canstack d3 c4)
    (canstack d3 s4)
    (canstack d4 c5)
    (canstack d4 s5)
    (canstack d5 c6)
    (canstack d5 s6)
    (canstack d6 c7)
    (canstack d6 s7)
    (canstack d7 c8)
    (canstack d7 s8)
    (canstack d8 c9)
    (canstack d8 s9)
    (canstack d9 c10)
    (canstack d9 s10)
    (canstack da c2)
    (canstack da s2)
    (canstack h10 cj)
    (canstack h10 sj)
    (canstack h2 c3)
    (canstack h2 s3)
    (canstack h3 c4)
    (canstack h3 s4)
    (canstack h4 c5)
    (canstack h4 s5)
    (canstack h5 c6)
    (canstack h5 s6)
    (canstack h6 c7)
    (canstack h6 s7)
    (canstack h7 c8)
    (canstack h7 s8)
    (canstack h8 c9)
    (canstack h8 s9)
    (canstack h9 c10)
    (canstack h9 s10)
    (canstack ha c2)
    (canstack ha s2)
    (canstack s10 dj)
    (canstack s10 hj)
    (canstack s2 d3)
    (canstack s2 h3)
    (canstack s3 d4)
    (canstack s3 h4)
    (canstack s4 d5)
    (canstack s4 h5)
    (canstack s5 d6)
    (canstack s5 h6)
    (canstack s6 d7)
    (canstack s6 h7)
    (canstack s7 d8)
    (canstack s7 h8)
    (canstack s8 d9)
    (canstack s8 h9)
    (canstack s9 d10)
    (canstack s9 h10)
    (canstack sa d2)
    (canstack sa h2)
    (home c0)
    (home d0)
    (home h0)
    (home s0)
    (cellspace n4)
    (colspace n0)
    (on c10 s7)
    (on c2 h9)
    (on c3 s2)
    (on c5 ha)
    (on c6 hj)
    (on c7 h10)
    (on c8 dj)
    (on c9 d2)
    (on ca d7)
    (on cj s6)
    (on d10 s3)
    (on d4 c4)
    (on d5 sa)
    (on d6 d9)
    (on d7 d8)
    (on d8 s4)
    (on d9 h7)
    (on da c10)
    (on dj c9)
    (on h10 c8)
    (on h2 s5)
    (on h4 cj)
    (on h5 c2)
    (on h6 h8)
    (on h7 h3)
    (on h8 d4)
    (on hj h5)
    (on s10 d6)
    (on s3 c5)
    (on s4 d3)
    (on s5 d10)
    (on s6 c3)
    (on s7 d5)
    (on s9 h2)
    (on sa s8)
    (on sj ca)
    (clear c6)
    (clear c7)
    (clear da)
    (clear h4)
    (clear h6)
    (clear s10)
    (clear s9)
    (clear sj)
    (bottomcol c4)
    (bottomcol d2)
    (bottomcol d3)
    (bottomcol h3)
    (bottomcol h9)
    (bottomcol ha)
    (bottomcol s2)
    (bottomcol s8)
)
(:goal (and
    (home cj)
    (home dj)
    (home hj)
    (home sj)
)))
