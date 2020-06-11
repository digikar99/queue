(defsystem "queue"
  :version "0.1.0"
  :author "Shubhamkar B. Ayare (shubhamayare@yahoo.co.in)"
  :license "MIT"
  :description "Simple constant time FIFO queue in Common Lisp."
  :serial t
  :components ((:file "queue"))
  :in-order-to ((test-op (test-op "queue/test"))))

(defsystem "queue/test"
  :version "0.1.0"
  :author "Shubhamkar B. Ayare (shubhamayare@yahoo.co.in)"
  :license "MIT"
  :description "Test suite for queue."
  :serial t  
  :depends-on ("queue" "fiveam")
  :components ((:file "queue-test"))
  :perform (test-op (op c)
                    (eval (read-from-string
                           "(let ((5am:*on-failure* :debug))
                             (5am:run! :queue))"))))
