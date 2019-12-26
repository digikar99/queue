;;; NOTE: prove is succeeded by rove; but rove says API is not stable: https://github.com/fukamachi/rove

(defpackage :queue-test
  (:use :cl :queue :prove))
(in-package :queue-test)

(plan nil)
(setq *default-reporter* :tap)

(deftest make-queue-and-dequeue
  (let ((queue (make-queue 2 3 4)))
    (is (queue-size queue) 3)
    (is (dequeue queue) 2)
    (is (dequeue queue) 3)
    (is (queue-size queue) 1)
    (is (dequeue queue) 4)
    (is-error (dequeue queue) 'error)))

(deftest enqueue-and-dequeue
  (let ((queue (make-queue)))
    (enqueue queue 1)
    (is (dequeue queue) 1)
    (enqueue queue 1 3)
    (is (dequeue queue) 1)
    (is (queue-size queue) 1)
    (is (dequeue queue) 3)
    (is-error (dequeue queue) 'error)))

(deftest queue-empty-p
  (let ((queue (make-queue)))
    (prove:is (queue-empty-p queue) t))
  (let ((queue (make-queue 1 2)))
    (prove:isnt (queue-empty-p queue) t)))






