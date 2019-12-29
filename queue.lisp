(defpackage :queue
  (:use :cl)
  (:export
   :make-queue
   :enqueue
   :dequeue
   :print-queue
   :queue-empty-p
   :queue-size))

(in-package :queue)

(defstruct (queue (:constructor %make-queue)) head tail size)

(defun make-queue (&rest initial-elements)
  "Create a new queue with INITIAL-ELEMENTS inserted in the order of appearance."
  (%make-queue :head initial-elements
               :tail (last initial-elements)
               :size (length initial-elements)))

;;; More efficient than doing one element at a time.
(defun enqueue (queue &rest elt)
  "Push ELTs onto the tail of QUEUE in the order of appearance."
  (when elt
    (with-slots (tail size) queue    
      (if tail
          (setf (cdr tail) elt
                tail (last tail))
          (setf (queue-head queue) elt
                tail (last elt)))
      (incf size (length elt))))
  queue)

(defun queue-empty-p (queue) (zerop (queue-size queue)))

(defun dequeue (queue)
  "Pop from the front of QUEUE. Raises an error if QUEUE is empty."
  (with-slots (head size) queue
    (let (return-value)
      (cond ((queue-empty-p queue) (error "Trying to dequeue empty queue ~D" queue))
            ((null (cdr head)) ; queue of length 1
             (setf return-value (car head)
                   head (cdr head)
                   (queue-tail queue) head))
            (t
             (setf return-value (car head)
                   head (cdr head))))
      (decf size)
      return-value)))

(defun print-queue (queue &optional (num-elements 5))
  (let ((subqueue (subseq (queue-head queue)
                          0
                          (min (queue-size queue) num-elements))))
    (format t "(~{~A~^ ~})" subqueue)))

(defmethod print-object ((queue queue) stream)
  (print-unreadable-object (queue stream :type t :identity t)
    (format stream "HEAD ~D" (first (queue-head queue)))))
