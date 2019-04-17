;;;
;;; Test filename-comparator
;;;

(use gauche.test)

(test-start "filename-comparator")
(use filename-comparator)

(test-module 'filename-comparator)

(test* "less" #t (<? filename-comparator "abc40" "abc300"))
(test* "less" #t (<? filename-comparator "abc040" "abc40"))
(test* "not less" #f (<? filename-comparator "abc40" "abc31"))
(test* "equal" #t (=? filename-comparator "abc30" "abc30"))
(test* "not equal" #f (=? filename-comparator "abc30" "cba30"))
(test* "greater" #t (>? filename-comparator "abc40" "abc30"))
(test* "not greater" #f (>? filename-comparator "abc40" "abc300"))

(test-end :exit-on-failure #t)
