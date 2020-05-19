;;
;; Copyright (c) 2020 by Damien Pellier <Damien.Pellier@imag.fr>.
;;
;; This file is part of PDDL4J library.
;;
;; PDDL4J is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; PDDL4J is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with PDDL4J.  If not, see <http://www.gnu.org/licenses/>
;;

(define (problem p04)

    (:domain barman)

    (:objects
         shaker1 - shaker
         left right - hand
         shot1 shot2 shot3 shot4 shot5 shot6 shot7 shot8 shot9 shot10 shot11 shot12 shot13 - shot
         ingredient1 ingredient2 ingredient3 ingredient4 - ingredient
         cocktail1 cocktail2 cocktail3 cocktail4 cocktail5 cocktail6 cocktail7 cocktail8 cocktail9 cocktail10 - cocktail
         dispenser1 dispenser2 dispenser3 dispenser4 - dispenser
         l0 l1 l2 - level
    )

    (:htn
        :ordered-subtasks (and
            (serve_cocktail shot1 cocktail4)
            (serve_cocktail shot2 cocktail5)
            (serve_cocktail shot3 cocktail10)
            (serve_cocktail shot4 cocktail8)
            (serve_cocktail shot5 cocktail9)
            (serve_cocktail shot6 cocktail6)
            (serve_cocktail shot7 cocktail3)
            (serve_cocktail shot8 cocktail1)
            (serve_cocktail shot9 cocktail7)
            (serve_cocktail shot10 cocktail2)
            (serve_cocktail shot11 cocktail10)
            (serve_shot shot12 ingredient3)
        )
    )

    (:init
      (ontable shaker1)
      (ontable shot1)
      (ontable shot2)
      (ontable shot3)
      (ontable shot4)
      (ontable shot5)
      (ontable shot6)
      (ontable shot7)
      (ontable shot8)
      (ontable shot9)
      (ontable shot10)
      (ontable shot11)
      (ontable shot12)
      (ontable shot13)
      (dispenses dispenser1 ingredient1)
      (dispenses dispenser2 ingredient2)
      (dispenses dispenser3 ingredient3)
      (dispenses dispenser4 ingredient4)
      (clean shaker1)
      (clean shot1)
      (clean shot2)
      (clean shot3)
      (clean shot4)
      (clean shot5)
      (clean shot6)
      (clean shot7)
      (clean shot8)
      (clean shot9)
      (clean shot10)
      (clean shot11)
      (clean shot12)
      (clean shot13)
      (empty shaker1)
      (empty shot1)
      (empty shot2)
      (empty shot3)
      (empty shot4)
      (empty shot5)
      (empty shot6)
      (empty shot7)
      (empty shot8)
      (empty shot9)
      (empty shot10)
      (empty shot11)
      (empty shot12)
      (empty shot13)
      (handempty left)
      (handempty right)
      (shaker-empty-level shaker1 l0)
      (shaker-level shaker1 l0)
      (next l0 l1)
      (next l1 l2)
      (cocktail-part1 cocktail1 ingredient3)
      (cocktail-part2 cocktail1 ingredient1)
      (cocktail-part1 cocktail2 ingredient4)
      (cocktail-part2 cocktail2 ingredient3)
      (cocktail-part1 cocktail3 ingredient1)
      (cocktail-part2 cocktail3 ingredient3)
      (cocktail-part1 cocktail4 ingredient3)
      (cocktail-part2 cocktail4 ingredient2)
      (cocktail-part1 cocktail5 ingredient1)
      (cocktail-part2 cocktail5 ingredient2)
      (cocktail-part1 cocktail6 ingredient4)
      (cocktail-part2 cocktail6 ingredient1)
      (cocktail-part1 cocktail7 ingredient1)
      (cocktail-part2 cocktail7 ingredient4)
      (cocktail-part1 cocktail8 ingredient3)
      (cocktail-part2 cocktail8 ingredient1)
      (cocktail-part1 cocktail9 ingredient2)
      (cocktail-part2 cocktail9 ingredient1)
      (cocktail-part1 cocktail10 ingredient1)
      (cocktail-part2 cocktail10 ingredient4)
    )
)
