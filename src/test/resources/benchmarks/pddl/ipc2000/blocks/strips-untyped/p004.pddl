(define (problem blocks-5-0)
(:domain blocks)
(:objects b e a c d )
(:init (clear d) (clear c) (ontable d) (ontable a) (on c e) (on e b) (on b a)
 (handempty))
(:goal (and (on a e) (on e b) (on b d) (on d c)))
)