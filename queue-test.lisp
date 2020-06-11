;;; NOTE: prove is succeeded by rove; but rove says API is not stable: https://github.com/fukamachi/rove

(defpackage :queue/test
  (:use :cl :queue :fiveam))
(in-package :queue/test)

(def-suite :queue)
(in-suite :queue)

(def-test make-queue-and-dequeue ()
  (write-line "  QUEUE-SIZE is tested implicitly.")
  (let ((queue (make-queue 2 3 4)))
    (is (eq (queue-size queue) 3))
    (is (eq (dequeue queue) 2))
    (is (eq (dequeue queue) 3))
    (is (eq (queue-size queue) 1))
    (is (eq (dequeue queue) 4))
    (is (typep (handler-case (dequeue queue)
                 (condition (c) c))
               'error))))

(def-test enqueue-and-dequeue ()
  (let ((queue (make-queue)))
    (enqueue queue 1)
    (is (eq (dequeue queue) 1))
    (enqueue queue 1 3)
    (is (eq (dequeue queue) 1))
    (is (eq (queue-size queue) 1))
    (is (eq (dequeue queue) 3))
    (is (typep (handler-case (dequeue queue)
                 (condition (c) c))
               'error))))

(def-test queue-empty-p ()
  (let ((queue (make-queue)))
    (is (eq (queue-empty-p queue) t)))
  (let ((queue (make-queue 1 2)))
    (is (eq (queue-empty-p queue) nil))))

(def-test queue-to-list ()
  (let ((queue (make-queue 2 3 4)))
    (is (equalp (queue-to-list queue) '(2 3 4)))
    (is (equalp (queue-to-list queue 2) '(2 3)))
    (is (equalp (queue-to-list queue 0) '()))))
