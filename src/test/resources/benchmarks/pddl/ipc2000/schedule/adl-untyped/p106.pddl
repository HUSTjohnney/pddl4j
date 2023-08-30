(define (problem schedule-37-0)
(:domain schedule)
(:objects
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
    (shape a0 circular)
    (surface-condition a0 rough)
    (painted a0 blue)
    (has-hole a0 two front)
    (temperature a0 cold)
    (shape b0 cylindrical)
    (surface-condition b0 smooth)
    (painted b0 red)
    (has-hole b0 two front)
    (temperature b0 cold)
    (shape c0 cylindrical)
    (surface-condition c0 smooth)
    (painted c0 yellow)
    (has-hole c0 two front)
    (temperature c0 cold)
    (shape d0 oblong)
    (surface-condition d0 rough)
    (painted d0 black)
    (has-hole d0 two front)
    (temperature d0 cold)
    (shape e0 cylindrical)
    (surface-condition e0 smooth)
    (painted e0 blue)
    (has-hole e0 two back)
    (temperature e0 cold)
    (shape f0 oblong)
    (surface-condition f0 polished)
    (painted f0 yellow)
    (has-hole f0 two back)
    (temperature f0 cold)
    (shape g0 circular)
    (surface-condition g0 rough)
    (painted g0 blue)
    (has-hole g0 three front)
    (temperature g0 cold)
    (shape h0 circular)
    (surface-condition h0 smooth)
    (painted h0 yellow)
    (has-hole h0 three back)
    (temperature h0 cold)
    (shape i0 cylindrical)
    (surface-condition i0 polished)
    (painted i0 black)
    (has-hole i0 three front)
    (temperature i0 cold)
    (shape j0 circular)
    (surface-condition j0 polished)
    (painted j0 blue)
    (has-hole j0 one back)
    (temperature j0 cold)
    (shape k0 oblong)
    (surface-condition k0 smooth)
    (painted k0 black)
    (has-hole k0 one back)
    (temperature k0 cold)
    (shape l0 oblong)
    (surface-condition l0 rough)
    (painted l0 blue)
    (has-hole l0 one back)
    (temperature l0 cold)
    (shape m0 oblong)
    (surface-condition m0 rough)
    (painted m0 red)
    (has-hole m0 three front)
    (temperature m0 cold)
    (shape n0 cylindrical)
    (surface-condition n0 rough)
    (painted n0 black)
    (has-hole n0 two back)
    (temperature n0 cold)
    (shape o0 circular)
    (surface-condition o0 rough)
    (painted o0 red)
    (has-hole o0 two back)
    (temperature o0 cold)
    (shape q0 cylindrical)
    (surface-condition q0 polished)
    (painted q0 blue)
    (has-hole q0 two back)
    (temperature q0 cold)
    (shape p0 cylindrical)
    (surface-condition p0 polished)
    (painted p0 black)
    (has-hole p0 three front)
    (temperature p0 cold)
    (shape r0 circular)
    (surface-condition r0 rough)
    (painted r0 yellow)
    (has-hole r0 three front)
    (temperature r0 cold)
    (shape s0 oblong)
    (surface-condition s0 smooth)
    (painted s0 red)
    (has-hole s0 two back)
    (temperature s0 cold)
    (shape u0 oblong)
    (surface-condition u0 polished)
    (painted u0 red)
    (has-hole u0 two back)
    (temperature u0 cold)
    (shape v0 oblong)
    (surface-condition v0 rough)
    (painted v0 red)
    (has-hole v0 one back)
    (temperature v0 cold)
    (shape w0 cylindrical)
    (surface-condition w0 smooth)
    (painted w0 red)
    (has-hole w0 three back)
    (temperature w0 cold)
    (shape z0 cylindrical)
    (surface-condition z0 smooth)
    (painted z0 blue)
    (has-hole z0 three front)
    (temperature z0 cold)
    (shape a1 circular)
    (surface-condition a1 polished)
    (painted a1 black)
    (has-hole a1 one back)
    (temperature a1 cold)
    (shape b1 cylindrical)
    (surface-condition b1 polished)
    (painted b1 black)
    (has-hole b1 three back)
    (temperature b1 cold)
    (shape c1 oblong)
    (surface-condition c1 rough)
    (painted c1 blue)
    (has-hole c1 two back)
    (temperature c1 cold)
    (shape d1 circular)
    (surface-condition d1 polished)
    (painted d1 red)
    (has-hole d1 three back)
    (temperature d1 cold)
    (shape e1 circular)
    (surface-condition e1 polished)
    (painted e1 red)
    (has-hole e1 two front)
    (temperature e1 cold)
    (shape f1 circular)
    (surface-condition f1 smooth)
    (painted f1 red)
    (has-hole f1 three front)
    (temperature f1 cold)
    (shape g1 circular)
    (surface-condition g1 polished)
    (painted g1 yellow)
    (has-hole g1 three front)
    (temperature g1 cold)
    (shape h1 cylindrical)
    (surface-condition h1 polished)
    (painted h1 blue)
    (has-hole h1 one front)
    (temperature h1 cold)
    (shape i1 circular)
    (surface-condition i1 rough)
    (painted i1 blue)
    (has-hole i1 one back)
    (temperature i1 cold)
    (shape j1 oblong)
    (surface-condition j1 polished)
    (painted j1 yellow)
    (has-hole j1 three back)
    (temperature j1 cold)
    (shape k1 cylindrical)
    (surface-condition k1 polished)
    (painted k1 yellow)
    (has-hole k1 one front)
    (temperature k1 cold)
    (shape l1 cylindrical)
    (surface-condition l1 smooth)
    (painted l1 red)
    (has-hole l1 one back)
    (temperature l1 cold)
    (shape m1 oblong)
    (surface-condition m1 smooth)
    (painted m1 yellow)
    (has-hole m1 two front)
    (temperature m1 cold)
    (shape n1 oblong)
    (surface-condition n1 smooth)
    (painted n1 yellow)
    (has-hole n1 one back)
    (temperature n1 cold)
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
    (shape e1 cylindrical)
    (shape a0 cylindrical)
    (painted e1 yellow)
    (painted l1 black)
    (surface-condition p0 smooth)
    (surface-condition h1 rough)
    (shape j0 cylindrical)
    (surface-condition m0 smooth)
    (surface-condition z0 rough)
    (shape s0 cylindrical)
    (surface-condition i1 polished)
    (shape i1 cylindrical)
    (surface-condition b0 polished)
    (surface-condition u0 smooth)
    (painted m0 yellow)
    (painted m1 blue)
    (shape m0 cylindrical)
    (painted v0 yellow)
    (shape v0 cylindrical)
    (painted i1 black)
    (surface-condition h0 polished)
    (shape d1 cylindrical)
    (painted g1 blue)
    (painted b0 blue)
    (shape o0 cylindrical)
    (surface-condition b1 rough)
    (surface-condition l0 polished)
    (painted r0 black)
    (shape l0 cylindrical)
    (surface-condition j1 smooth)
    (painted o0 black)
    (surface-condition k1 smooth)
    (shape n1 cylindrical)
    (shape u0 cylindrical)
    (shape m1 cylindrical)
    (surface-condition v0 polished)
    (painted h1 black)
)))
