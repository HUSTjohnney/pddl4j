(define (problem blocks-14-0)
(:domain blocks)
(:objects i d b l c k m h j n e f g a )
(:init (clear a) (clear g) (clear f) (ontable e) (ontable n) (ontable f)
 (on a j) (on j h) (on h m) (on m k) (on k c) (on c l) (on l b) (on b e)
 (on g d) (on d i) (on i n) (handempty))
(:goal (and (on e l) (on l f) (on f b) (on b j) (on j i) (on i n) (on n c)
            (on c k) (on k g) (on g d) (on d m) (on m a) (on a h)))
)