(define (problem schedule-34-2)
(:domain schedule)
(:objects
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
    (surface-condition a0 smooth)
    (painted a0 red)
    (has-hole a0 three front)
    (temperature a0 cold)
    (shape b0 cylindrical)
    (surface-condition b0 polished)
    (painted b0 yellow)
    (has-hole b0 three back)
    (temperature b0 cold)
    (shape c0 oblong)
    (surface-condition c0 polished)
    (painted c0 blue)
    (has-hole c0 two front)
    (temperature c0 cold)
    (shape d0 oblong)
    (surface-condition d0 polished)
    (painted d0 red)
    (has-hole d0 one back)
    (temperature d0 cold)
    (shape e0 oblong)
    (surface-condition e0 polished)
    (painted e0 red)
    (has-hole e0 three back)
    (temperature e0 cold)
    (shape f0 circular)
    (surface-condition f0 rough)
    (painted f0 red)
    (has-hole f0 one front)
    (temperature f0 cold)
    (shape g0 cylindrical)
    (surface-condition g0 polished)
    (painted g0 red)
    (has-hole g0 one front)
    (temperature g0 cold)
    (shape h0 oblong)
    (surface-condition h0 rough)
    (painted h0 black)
    (has-hole h0 three back)
    (temperature h0 cold)
    (shape i0 oblong)
    (surface-condition i0 polished)
    (painted i0 red)
    (has-hole i0 two back)
    (temperature i0 cold)
    (shape j0 cylindrical)
    (surface-condition j0 smooth)
    (painted j0 blue)
    (has-hole j0 three front)
    (temperature j0 cold)
    (shape k0 circular)
    (surface-condition k0 rough)
    (painted k0 red)
    (has-hole k0 three front)
    (temperature k0 cold)
    (shape l0 oblong)
    (surface-condition l0 polished)
    (painted l0 blue)
    (has-hole l0 three front)
    (temperature l0 cold)
    (shape m0 cylindrical)
    (surface-condition m0 polished)
    (painted m0 red)
    (has-hole m0 three back)
    (temperature m0 cold)
    (shape n0 oblong)
    (surface-condition n0 smooth)
    (painted n0 red)
    (has-hole n0 three back)
    (temperature n0 cold)
    (shape o0 circular)
    (surface-condition o0 smooth)
    (painted o0 blue)
    (has-hole o0 one back)
    (temperature o0 cold)
    (shape q0 circular)
    (surface-condition q0 rough)
    (painted q0 blue)
    (has-hole q0 three back)
    (temperature q0 cold)
    (shape p0 cylindrical)
    (surface-condition p0 smooth)
    (painted p0 yellow)
    (has-hole p0 three front)
    (temperature p0 cold)
    (shape r0 oblong)
    (surface-condition r0 polished)
    (painted r0 red)
    (has-hole r0 one front)
    (temperature r0 cold)
    (shape s0 circular)
    (surface-condition s0 smooth)
    (painted s0 blue)
    (has-hole s0 two back)
    (temperature s0 cold)
    (shape u0 oblong)
    (surface-condition u0 polished)
    (painted u0 black)
    (has-hole u0 two back)
    (temperature u0 cold)
    (shape v0 cylindrical)
    (surface-condition v0 polished)
    (painted v0 yellow)
    (has-hole v0 two front)
    (temperature v0 cold)
    (shape w0 oblong)
    (surface-condition w0 smooth)
    (painted w0 blue)
    (has-hole w0 three front)
    (temperature w0 cold)
    (shape z0 oblong)
    (surface-condition z0 rough)
    (painted z0 blue)
    (has-hole z0 two back)
    (temperature z0 cold)
    (shape a1 cylindrical)
    (surface-condition a1 polished)
    (painted a1 black)
    (has-hole a1 three back)
    (temperature a1 cold)
    (shape b1 cylindrical)
    (surface-condition b1 rough)
    (painted b1 red)
    (has-hole b1 two back)
    (temperature b1 cold)
    (shape c1 oblong)
    (surface-condition c1 smooth)
    (painted c1 black)
    (has-hole c1 three front)
    (temperature c1 cold)
    (shape d1 cylindrical)
    (surface-condition d1 rough)
    (painted d1 black)
    (has-hole d1 one front)
    (temperature d1 cold)
    (shape e1 circular)
    (surface-condition e1 smooth)
    (painted e1 black)
    (has-hole e1 one front)
    (temperature e1 cold)
    (shape f1 oblong)
    (surface-condition f1 smooth)
    (painted f1 red)
    (has-hole f1 one front)
    (temperature f1 cold)
    (shape g1 cylindrical)
    (surface-condition g1 polished)
    (painted g1 blue)
    (has-hole g1 two front)
    (temperature g1 cold)
    (shape h1 circular)
    (surface-condition h1 rough)
    (painted h1 black)
    (has-hole h1 one back)
    (temperature h1 cold)
    (shape i1 circular)
    (surface-condition i1 polished)
    (painted i1 blue)
    (has-hole i1 one back)
    (temperature i1 cold)
    (shape j1 oblong)
    (surface-condition j1 smooth)
    (painted j1 red)
    (has-hole j1 two back)
    (temperature j1 cold)
    (shape k1 cylindrical)
    (surface-condition k1 smooth)
    (painted k1 black)
    (has-hole k1 two front)
    (temperature k1 cold)
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
    (shape d0 cylindrical)
    (shape c0 cylindrical)
    (surface-condition u0 smooth)
    (shape r0 cylindrical)
    (surface-condition j1 rough)
    (painted a0 black)
    (painted z0 yellow)
    (surface-condition e1 polished)
    (surface-condition v0 rough)
    (shape e1 cylindrical)
    (surface-condition s0 rough)
    (surface-condition j0 polished)
    (painted s0 red)
    (painted j0 red)
    (surface-condition m0 rough)
    (painted m0 black)
    (surface-condition l0 smooth)
    (surface-condition r0 smooth)
    (painted d1 yellow)
    (shape i1 cylindrical)
    (painted i0 black)
    (surface-condition i0 rough)
    (painted g0 blue)
    (shape s0 cylindrical)
    (shape u0 cylindrical)
    (painted k1 yellow)
    (surface-condition w0 polished)
    (painted f0 yellow)
    (surface-condition o0 polished)
    (painted w0 black)
    (surface-condition g0 rough)
    (painted c1 blue)
    (shape o0 cylindrical)
    (painted j1 black)
)))
