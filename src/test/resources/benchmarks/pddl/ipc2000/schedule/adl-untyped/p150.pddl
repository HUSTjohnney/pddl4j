(define (problem schedule-51-2)
(:domain schedule)
(:objects
    e2
    d2
    c2
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
    circular
    two
    three
    blue
    yellow
    back
    red
    b0
    front
    one
    black
    oblong
    a0
)
(:init
    (shape a0 cylindrical)
    (surface-condition a0 rough)
    (painted a0 yellow)
    (has-hole a0 one front)
    (temperature a0 cold)
    (shape b0 cylindrical)
    (surface-condition b0 polished)
    (painted b0 yellow)
    (has-hole b0 one back)
    (temperature b0 cold)
    (shape c0 oblong)
    (surface-condition c0 rough)
    (painted c0 red)
    (has-hole c0 three back)
    (temperature c0 cold)
    (shape d0 cylindrical)
    (surface-condition d0 rough)
    (painted d0 red)
    (has-hole d0 two front)
    (temperature d0 cold)
    (shape e0 cylindrical)
    (surface-condition e0 smooth)
    (painted e0 blue)
    (has-hole e0 three back)
    (temperature e0 cold)
    (shape f0 cylindrical)
    (surface-condition f0 rough)
    (painted f0 black)
    (has-hole f0 two back)
    (temperature f0 cold)
    (shape g0 oblong)
    (surface-condition g0 polished)
    (painted g0 blue)
    (has-hole g0 one front)
    (temperature g0 cold)
    (shape h0 circular)
    (surface-condition h0 polished)
    (painted h0 yellow)
    (has-hole h0 three front)
    (temperature h0 cold)
    (shape i0 circular)
    (surface-condition i0 smooth)
    (painted i0 black)
    (has-hole i0 three back)
    (temperature i0 cold)
    (shape j0 oblong)
    (surface-condition j0 rough)
    (painted j0 red)
    (has-hole j0 one front)
    (temperature j0 cold)
    (shape k0 circular)
    (surface-condition k0 rough)
    (painted k0 yellow)
    (has-hole k0 one front)
    (temperature k0 cold)
    (shape l0 oblong)
    (surface-condition l0 rough)
    (painted l0 blue)
    (has-hole l0 one back)
    (temperature l0 cold)
    (shape m0 oblong)
    (surface-condition m0 smooth)
    (painted m0 yellow)
    (has-hole m0 one back)
    (temperature m0 cold)
    (shape n0 cylindrical)
    (surface-condition n0 polished)
    (painted n0 red)
    (has-hole n0 two front)
    (temperature n0 cold)
    (shape o0 cylindrical)
    (surface-condition o0 smooth)
    (painted o0 red)
    (has-hole o0 one back)
    (temperature o0 cold)
    (shape q0 cylindrical)
    (surface-condition q0 smooth)
    (painted q0 red)
    (has-hole q0 two back)
    (temperature q0 cold)
    (shape p0 circular)
    (surface-condition p0 smooth)
    (painted p0 black)
    (has-hole p0 three front)
    (temperature p0 cold)
    (shape r0 cylindrical)
    (surface-condition r0 smooth)
    (painted r0 blue)
    (has-hole r0 one front)
    (temperature r0 cold)
    (shape s0 circular)
    (surface-condition s0 smooth)
    (painted s0 red)
    (has-hole s0 two back)
    (temperature s0 cold)
    (shape u0 circular)
    (surface-condition u0 smooth)
    (painted u0 black)
    (has-hole u0 two back)
    (temperature u0 cold)
    (shape v0 cylindrical)
    (surface-condition v0 rough)
    (painted v0 red)
    (has-hole v0 two front)
    (temperature v0 cold)
    (shape w0 circular)
    (surface-condition w0 rough)
    (painted w0 yellow)
    (has-hole w0 three front)
    (temperature w0 cold)
    (shape z0 circular)
    (surface-condition z0 smooth)
    (painted z0 black)
    (has-hole z0 three front)
    (temperature z0 cold)
    (shape a1 oblong)
    (surface-condition a1 polished)
    (painted a1 blue)
    (has-hole a1 two back)
    (temperature a1 cold)
    (shape b1 circular)
    (surface-condition b1 rough)
    (painted b1 yellow)
    (has-hole b1 two front)
    (temperature b1 cold)
    (shape c1 circular)
    (surface-condition c1 rough)
    (painted c1 black)
    (has-hole c1 three front)
    (temperature c1 cold)
    (shape d1 oblong)
    (surface-condition d1 polished)
    (painted d1 red)
    (has-hole d1 one back)
    (temperature d1 cold)
    (shape e1 oblong)
    (surface-condition e1 rough)
    (painted e1 red)
    (has-hole e1 two back)
    (temperature e1 cold)
    (shape f1 oblong)
    (surface-condition f1 rough)
    (painted f1 yellow)
    (has-hole f1 one back)
    (temperature f1 cold)
    (shape g1 circular)
    (surface-condition g1 rough)
    (painted g1 yellow)
    (has-hole g1 one back)
    (temperature g1 cold)
    (shape h1 oblong)
    (surface-condition h1 polished)
    (painted h1 blue)
    (has-hole h1 one front)
    (temperature h1 cold)
    (shape i1 oblong)
    (surface-condition i1 polished)
    (painted i1 red)
    (has-hole i1 two back)
    (temperature i1 cold)
    (shape j1 cylindrical)
    (surface-condition j1 rough)
    (painted j1 black)
    (has-hole j1 two front)
    (temperature j1 cold)
    (shape k1 oblong)
    (surface-condition k1 smooth)
    (painted k1 blue)
    (has-hole k1 one front)
    (temperature k1 cold)
    (shape l1 cylindrical)
    (surface-condition l1 smooth)
    (painted l1 red)
    (has-hole l1 three front)
    (temperature l1 cold)
    (shape m1 oblong)
    (surface-condition m1 polished)
    (painted m1 yellow)
    (has-hole m1 one back)
    (temperature m1 cold)
    (shape n1 circular)
    (surface-condition n1 rough)
    (painted n1 yellow)
    (has-hole n1 three front)
    (temperature n1 cold)
    (shape o1 cylindrical)
    (surface-condition o1 smooth)
    (painted o1 yellow)
    (has-hole o1 two back)
    (temperature o1 cold)
    (shape q1 circular)
    (surface-condition q1 smooth)
    (painted q1 black)
    (has-hole q1 two front)
    (temperature q1 cold)
    (shape p1 circular)
    (surface-condition p1 polished)
    (painted p1 black)
    (has-hole p1 two back)
    (temperature p1 cold)
    (shape r1 circular)
    (surface-condition r1 rough)
    (painted r1 black)
    (has-hole r1 one back)
    (temperature r1 cold)
    (shape s1 oblong)
    (surface-condition s1 smooth)
    (painted s1 black)
    (has-hole s1 two back)
    (temperature s1 cold)
    (shape u1 cylindrical)
    (surface-condition u1 smooth)
    (painted u1 yellow)
    (has-hole u1 three front)
    (temperature u1 cold)
    (shape v1 cylindrical)
    (surface-condition v1 rough)
    (painted v1 yellow)
    (has-hole v1 three back)
    (temperature v1 cold)
    (shape w1 cylindrical)
    (surface-condition w1 polished)
    (painted w1 red)
    (has-hole w1 two back)
    (temperature w1 cold)
    (shape z1 oblong)
    (surface-condition z1 polished)
    (painted z1 yellow)
    (has-hole z1 one back)
    (temperature z1 cold)
    (shape a2 circular)
    (surface-condition a2 rough)
    (painted a2 blue)
    (has-hole a2 one front)
    (temperature a2 cold)
    (shape b2 circular)
    (surface-condition b2 polished)
    (painted b2 red)
    (has-hole b2 three back)
    (temperature b2 cold)
    (shape c2 circular)
    (surface-condition c2 smooth)
    (painted c2 yellow)
    (has-hole c2 two front)
    (temperature c2 cold)
    (shape d2 circular)
    (surface-condition d2 smooth)
    (painted d2 yellow)
    (has-hole d2 two back)
    (temperature d2 cold)
    (shape e2 cylindrical)
    (surface-condition e2 polished)
    (painted e2 red)
    (has-hole e2 three back)
    (temperature e2 cold)
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
    (part e2)
    (part d2)
    (part c2)
    (part b2)
    (part a2)
    (part z1)
    (part w1)
    (part v1)
    (part u1)
    (part s1)
    (part r1)
    (part p1)
    (part q1)
    (part o1)
    (part n1)
    (part m1)
    (part l1)
    (part k1)
    (part j1)
    (part i1)
    (part h1)
    (part g1)
    (part f1)
    (part e1)
    (part d1)
    (part c1)
    (part b1)
    (part a1)
    (part z0)
    (part w0)
    (part v0)
    (part u0)
    (part s0)
    (part r0)
    (part p0)
    (part q0)
    (part o0)
    (part n0)
    (part m0)
    (part l0)
    (part k0)
    (part j0)
    (part i0)
    (part h0)
    (part g0)
    (part f0)
    (part e0)
    (part d0)
    (part c0)
    (part b0)
    (part a0)
)
(:goal (and
    (painted a0 blue)
    (surface-condition u0 rough)
    (surface-condition c0 smooth)
    (surface-condition q0 polished)
    (shape g0 cylindrical)
    (shape j0 cylindrical)
    (painted c1 red)
    (shape m0 cylindrical)
    (shape u0 cylindrical)
    (surface-condition b0 rough)
    (surface-condition s0 rough)
    (surface-condition b2 smooth)
    (painted a2 black)
    (painted h0 black)
    (painted n1 red)
    (painted i1 blue)
    (painted z0 yellow)
    (shape e1 cylindrical)
    (surface-condition e2 rough)
    (shape k1 cylindrical)
    (painted a1 black)
    (surface-condition o0 polished)
    (shape h1 cylindrical)
    (shape i0 cylindrical)
    (painted q1 blue)
    (shape a2 cylindrical)
    (surface-condition m1 rough)
    (surface-condition r1 polished)
    (surface-condition i0 rough)
    (painted g1 black)
    (painted j1 yellow)
    (surface-condition b1 polished)
    (surface-condition e0 polished)
    (painted b2 yellow)
    (painted f1 black)
    (painted b0 red)
    (surface-condition z0 rough)
    (painted i0 yellow)
    (painted v0 yellow)
    (shape b1 cylindrical)
    (shape m1 cylindrical)
    (painted u0 red)
    (painted d0 blue)
    (surface-condition j1 polished)
    (surface-condition f0 polished)
    (painted m0 black)
    (painted w0 red)
    (surface-condition h0 rough)
    (painted h1 yellow)
    (shape d1 cylindrical)
    (surface-condition p0 polished)
)))
