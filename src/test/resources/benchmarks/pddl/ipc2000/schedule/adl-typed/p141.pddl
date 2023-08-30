(define (problem schedule-48-2)
(:domain schedule)
(:objects
    b2
    a2
    z1
    w1
    v1
    u1
    s1
    r1
    p1
    q1
    o1
    n1
    m1
    l1
    k1
    j1
    i1
    h1
    g1
    f1
    e1
    d1
    c1
    b1
    a1
    z0
    w0
    v0
    u0
    s0
    r0
    p0
    q0
    o0
    n0
    m0
    l0
    k0
    j0
    i0
    h0
    g0
    f0
    e0
    d0
    c0
    b0
    a0
 - part
    circular
    oblong
 - ashape
    blue
    yellow
    red
    black
 - colour
    two
    three
    one
 - width
    back
    front
 - anorient
)
(:init
    (shape a0 oblong)
    (surface-condition a0 smooth)
    (painted a0 black)
    (has-hole a0 two front)
    (temperature a0 cold)
    (shape b0 circular)
    (surface-condition b0 rough)
    (painted b0 black)
    (has-hole b0 two back)
    (temperature b0 cold)
    (shape c0 oblong)
    (surface-condition c0 smooth)
    (painted c0 black)
    (has-hole c0 three back)
    (temperature c0 cold)
    (shape d0 cylindrical)
    (surface-condition d0 smooth)
    (painted d0 black)
    (has-hole d0 two front)
    (temperature d0 cold)
    (shape e0 circular)
    (surface-condition e0 smooth)
    (painted e0 yellow)
    (has-hole e0 one front)
    (temperature e0 cold)
    (shape f0 oblong)
    (surface-condition f0 polished)
    (painted f0 blue)
    (has-hole f0 one back)
    (temperature f0 cold)
    (shape g0 cylindrical)
    (surface-condition g0 polished)
    (painted g0 blue)
    (has-hole g0 two back)
    (temperature g0 cold)
    (shape h0 oblong)
    (surface-condition h0 polished)
    (painted h0 red)
    (has-hole h0 two front)
    (temperature h0 cold)
    (shape i0 oblong)
    (surface-condition i0 polished)
    (painted i0 blue)
    (has-hole i0 one back)
    (temperature i0 cold)
    (shape j0 cylindrical)
    (surface-condition j0 rough)
    (painted j0 yellow)
    (has-hole j0 one front)
    (temperature j0 cold)
    (shape k0 oblong)
    (surface-condition k0 polished)
    (painted k0 yellow)
    (has-hole k0 one back)
    (temperature k0 cold)
    (shape l0 oblong)
    (surface-condition l0 rough)
    (painted l0 blue)
    (has-hole l0 one front)
    (temperature l0 cold)
    (shape m0 oblong)
    (surface-condition m0 rough)
    (painted m0 red)
    (has-hole m0 three back)
    (temperature m0 cold)
    (shape n0 cylindrical)
    (surface-condition n0 smooth)
    (painted n0 yellow)
    (has-hole n0 three back)
    (temperature n0 cold)
    (shape o0 oblong)
    (surface-condition o0 smooth)
    (painted o0 blue)
    (has-hole o0 one front)
    (temperature o0 cold)
    (shape q0 oblong)
    (surface-condition q0 smooth)
    (painted q0 black)
    (has-hole q0 two back)
    (temperature q0 cold)
    (shape p0 oblong)
    (surface-condition p0 smooth)
    (painted p0 blue)
    (has-hole p0 three front)
    (temperature p0 cold)
    (shape r0 cylindrical)
    (surface-condition r0 smooth)
    (painted r0 red)
    (has-hole r0 three back)
    (temperature r0 cold)
    (shape s0 cylindrical)
    (surface-condition s0 polished)
    (painted s0 yellow)
    (has-hole s0 two front)
    (temperature s0 cold)
    (shape u0 oblong)
    (surface-condition u0 rough)
    (painted u0 blue)
    (has-hole u0 three front)
    (temperature u0 cold)
    (shape v0 oblong)
    (surface-condition v0 rough)
    (painted v0 yellow)
    (has-hole v0 one front)
    (temperature v0 cold)
    (shape w0 oblong)
    (surface-condition w0 smooth)
    (painted w0 yellow)
    (has-hole w0 two front)
    (temperature w0 cold)
    (shape z0 circular)
    (surface-condition z0 rough)
    (painted z0 blue)
    (has-hole z0 three front)
    (temperature z0 cold)
    (shape a1 circular)
    (surface-condition a1 smooth)
    (painted a1 blue)
    (has-hole a1 two back)
    (temperature a1 cold)
    (shape b1 cylindrical)
    (surface-condition b1 polished)
    (painted b1 red)
    (has-hole b1 two front)
    (temperature b1 cold)
    (shape c1 cylindrical)
    (surface-condition c1 rough)
    (painted c1 black)
    (has-hole c1 one front)
    (temperature c1 cold)
    (shape d1 circular)
    (surface-condition d1 smooth)
    (painted d1 yellow)
    (has-hole d1 one front)
    (temperature d1 cold)
    (shape e1 cylindrical)
    (surface-condition e1 smooth)
    (painted e1 blue)
    (has-hole e1 three back)
    (temperature e1 cold)
    (shape f1 oblong)
    (surface-condition f1 rough)
    (painted f1 yellow)
    (has-hole f1 three back)
    (temperature f1 cold)
    (shape g1 cylindrical)
    (surface-condition g1 rough)
    (painted g1 blue)
    (has-hole g1 one front)
    (temperature g1 cold)
    (shape h1 cylindrical)
    (surface-condition h1 rough)
    (painted h1 blue)
    (has-hole h1 one front)
    (temperature h1 cold)
    (shape i1 circular)
    (surface-condition i1 rough)
    (painted i1 red)
    (has-hole i1 two back)
    (temperature i1 cold)
    (shape j1 cylindrical)
    (surface-condition j1 polished)
    (painted j1 black)
    (has-hole j1 one back)
    (temperature j1 cold)
    (shape k1 circular)
    (surface-condition k1 rough)
    (painted k1 blue)
    (has-hole k1 one front)
    (temperature k1 cold)
    (shape l1 circular)
    (surface-condition l1 rough)
    (painted l1 black)
    (has-hole l1 two front)
    (temperature l1 cold)
    (shape m1 oblong)
    (surface-condition m1 polished)
    (painted m1 black)
    (has-hole m1 one front)
    (temperature m1 cold)
    (shape n1 circular)
    (surface-condition n1 smooth)
    (painted n1 yellow)
    (has-hole n1 three front)
    (temperature n1 cold)
    (shape o1 circular)
    (surface-condition o1 rough)
    (painted o1 blue)
    (has-hole o1 three front)
    (temperature o1 cold)
    (shape q1 circular)
    (surface-condition q1 polished)
    (painted q1 red)
    (has-hole q1 one front)
    (temperature q1 cold)
    (shape p1 cylindrical)
    (surface-condition p1 polished)
    (painted p1 black)
    (has-hole p1 two back)
    (temperature p1 cold)
    (shape r1 cylindrical)
    (surface-condition r1 polished)
    (painted r1 yellow)
    (has-hole r1 two back)
    (temperature r1 cold)
    (shape s1 oblong)
    (surface-condition s1 rough)
    (painted s1 black)
    (has-hole s1 three back)
    (temperature s1 cold)
    (shape u1 oblong)
    (surface-condition u1 polished)
    (painted u1 yellow)
    (has-hole u1 three front)
    (temperature u1 cold)
    (shape v1 cylindrical)
    (surface-condition v1 smooth)
    (painted v1 blue)
    (has-hole v1 two back)
    (temperature v1 cold)
    (shape w1 circular)
    (surface-condition w1 polished)
    (painted w1 yellow)
    (has-hole w1 two front)
    (temperature w1 cold)
    (shape z1 circular)
    (surface-condition z1 rough)
    (painted z1 yellow)
    (has-hole z1 one back)
    (temperature z1 cold)
    (shape a2 circular)
    (surface-condition a2 rough)
    (painted a2 yellow)
    (has-hole a2 three back)
    (temperature a2 cold)
    (shape b2 oblong)
    (surface-condition b2 smooth)
    (painted b2 yellow)
    (has-hole b2 two back)
    (temperature b2 cold)
    (can-orient drill-press back)
    (can-orient punch back)
    (can-orient drill-press front)
    (can-orient punch front)
    (has-paint immersion-painter yellow)
    (has-paint spray-painter yellow)
    (has-paint immersion-painter blue)
    (has-paint spray-painter blue)
    (has-paint immersion-painter black)
    (has-paint spray-painter black)
    (has-paint immersion-painter red)
    (has-paint spray-painter red)
    (has-bit drill-press three)
    (has-bit punch three)
    (has-bit drill-press two)
    (has-bit punch two)
    (has-bit drill-press one)
    (has-bit punch one)
)
(:goal (and
    (shape n1 cylindrical)
    (surface-condition z0 polished)
    (shape q0 cylindrical)
    (surface-condition w1 smooth)
    (painted b0 blue)
    (painted m1 yellow)
    (surface-condition b2 polished)
    (surface-condition k0 smooth)
    (surface-condition i1 smooth)
    (painted b1 yellow)
    (surface-condition r0 rough)
    (painted p0 black)
    (surface-condition l1 polished)
    (surface-condition n0 rough)
    (painted q1 black)
    (shape e0 cylindrical)
    (shape v0 cylindrical)
    (shape o0 cylindrical)
    (surface-condition a2 smooth)
    (surface-condition c1 smooth)
    (painted g0 black)
    (shape u0 cylindrical)
    (surface-condition l0 smooth)
    (shape l0 cylindrical)
    (surface-condition a0 rough)
    (surface-condition h0 rough)
    (shape c0 cylindrical)
    (surface-condition f1 smooth)
    (surface-condition s1 smooth)
    (painted c1 yellow)
    (painted k1 black)
    (painted d0 yellow)
    (surface-condition g1 polished)
    (painted o0 yellow)
    (surface-condition p1 rough)
    (surface-condition d0 rough)
    (shape z0 cylindrical)
    (shape i1 cylindrical)
    (surface-condition m1 smooth)
    (painted z0 yellow)
    (painted k0 red)
    (surface-condition j1 rough)
    (surface-condition e0 polished)
    (painted n1 black)
    (painted u0 yellow)
    (shape w1 cylindrical)
    (painted p1 yellow)
    (painted f1 black)
)))
